%%
%% %CopyrightBegin%
%% 
%% Copyright Ericsson AB 1997-2024. All Rights Reserved.
%% 
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%%
%%     http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.
%% 
%% %CopyrightEnd%
%%

%%%------------------------------------------------------------------
%%% Purpose:Convert Erlang files to html.
%%%------------------------------------------------------------------

-module(erl2html2).
-moduledoc false.
-export([convert/3, convert/4]).

convert([], _Dest, _InclPath) ->   % Fake clause.
    ok;
convert(File, Dest, InclPath) ->
    %% The generated code uses the BGCOLOR attribute in the
    %% BODY tag, which wasn't valid until HTML 3.2.  Also,
    %% good HTML should either override all colour attributes
    %% or none of them -- *never* just a few.
    %%
    %% FIXME: The colours should *really* be set with
    %% stylesheets...
    %%
    %% The html file is written with the same encoding as the input file.
    Encoding = encoding(File),
    Header = ["<!DOCTYPE HTML PUBLIC "
	      "\"-//W3C//DTD HTML 3.2 Final//EN\">\n"
	      "<!-- autogenerated by '",atom_to_list(?MODULE),"'. -->\n"
	      "<html>\n"
              "<head>\n"
              "<meta http-equiv=\"Content-Type\" content=\"text/html;"
                 "charset=",html_encoding(Encoding),"\"/></meta>\n"
              "<title>", to_raw_list(File,Encoding), "</title>\n"
              "</head>\n\n"
	      "<body bgcolor=\"white\" text=\"black\""
	      " link=\"blue\" vlink=\"purple\" alink=\"red\">\n"],
    convert(File, Dest, InclPath, Header).


convert(File, Dest, InclPath, Header) ->
    %% statistics(runtime),
    case parse_file(File, InclPath) of
	{ok,Functions} ->
	    %% {_, Time1} = statistics(runtime),
	    %% io:format("Parsed file in ~.2f Seconds.~n",[Time1/1000]),
	    case file:open(File,[raw,{read_ahead,10000}]) of
		{ok,SFd} ->
		    case file:open(Dest,[write,raw]) of
			{ok,DFd} ->
			    ok = file:write(DFd,[Header,"<pre>\n"]),
			    _Lines = build_html(SFd,DFd,encoding(File),Functions),
			    ok = file:write(DFd,["</pre>\n",footer(),
					    "</body>\n</html>\n"]),
			    %% {_, Time2} = statistics(runtime),
			    %% io:format("Converted ~p lines in ~.2f Seconds.~n",
			    %% 	      [_Lines, Time2/1000]),
			    ok = file:close(SFd),
			    ok = file:close(DFd),
			    ok;
			Error ->
			    Error
		    end;
		Error ->
		    Error
	    end;
	Error ->
	    Error
    end.

%%%-----------------------------------------------------------------
%%% Parse the input file to get the line numbers for all function
%%% definitions. This will be used when creating link targets for each
%%% function in build_html/5.
%%%
%%% All function clauses are also marked in order to allow
%%% possibly_enhance/2 to write these in bold.
%%%
%%% Use expanded preprocessor directives if possible (epp). Only if
%%% this fails, fall back on using non-expanded code (epp_dodger).

parse_file(File, InclPath) ->
    case epp:open(File, InclPath, []) of
	{ok,Epp} ->
	    try parse_preprocessed_file(Epp,File,false) of
		Forms ->
		    epp:close(Epp),
		    {ok,Forms}
	    catch
		_:{error,_Reason,true} ->
		    parse_non_preprocessed_file(File);
		_:{error,_Reason,false} ->
		    {ok,[]}
	    end;
	Error = {error,_} ->
	    Error
    end.

parse_preprocessed_file(Epp, File, InCorrectFile) ->
    case epp:parse_erl_form(Epp) of
	{ok,Form} ->
	    case Form of
		{attribute,_,file,{File,_}} ->
		    parse_preprocessed_file(Epp, File, true);
		{attribute,_,file,{_OtherFile,_}} ->
		    parse_preprocessed_file(Epp, File, false);
                {function,L,F,A,Cs} when InCorrectFile ->
                    {CLs,LastCL} = find_clause_lines(Cs, []),
		    %% tl(CLs) cause we know the start line already
		    [{atom_to_list(F),A,get_line(L),LastCL} | tl(CLs)] ++
			parse_preprocessed_file(Epp, File, true);
		_ ->
		    parse_preprocessed_file(Epp, File, InCorrectFile)
	    end;
	{error,Reason={_L,epp,{undefined,_Macro,none}}} ->
	    throw({error,Reason,InCorrectFile});
	{error,_Reason} ->
	    parse_preprocessed_file(Epp, File, InCorrectFile);
	{warning,_} ->
	    parse_preprocessed_file(Epp, File, InCorrectFile);
	{eof,_Location} ->
	    []
    end.

parse_non_preprocessed_file(File) ->
    case file:open(File, []) of
	{ok,Epp} ->
	    Forms = parse_non_preprocessed_file(Epp, File, 1),
	    ok = file:close(Epp),
	    {ok,Forms};
	Error = {error,_E} ->
	    Error
    end.

parse_non_preprocessed_file(Epp, File, Location) ->
    case epp_dodger:parse_form(Epp, Location) of
	{ok,Tree,Location1} ->
	    try erl_syntax:revert(Tree) of
                {function,L,F,A,Cs} ->
                    {CLs,LastCL} = find_clause_lines(Cs, []),
		    %% tl(CLs) cause we know the start line already
                    [{atom_to_list(F),A,get_line(L),LastCL} | tl(CLs)] ++
			parse_non_preprocessed_file(Epp, File, Location1);
		_ ->
		    parse_non_preprocessed_file(Epp, File, Location1)
	    catch
		_:_ -> parse_non_preprocessed_file(Epp, File, Location1)
	    end;
	{error,_E,Location1} ->
	    parse_non_preprocessed_file(Epp, File, Location1);
	{eof,_Location} ->
	    []
    end.

get_line(Anno) ->
    erl_anno:line(Anno).

%%%-----------------------------------------------------------------
%%% Find the line number of the last expression in the function
find_clause_lines([{clause,CL,_Params,_Op,Exprs}], CLs) -> % last clause
    case classify_exprs(Exprs) of
        {anno, Anno} ->
	    {lists:reverse([{clause,get_line(CL)}|CLs]), get_line(Anno)};
        {tree, Exprs1} ->
	    find_clause_lines([{clause,CL,undefined,undefined,Exprs1}], CLs);
        unknown ->
	    {lists:reverse([{clause,get_line(CL)}|CLs]), get_line(CL)}
    end;
find_clause_lines([{clause,CL,_Params,_Op,_Exprs} | Cs], CLs) ->
    find_clause_lines(Cs, [{clause,get_line(CL)}|CLs]).

classify_exprs(Exprs) ->
    case tuple_to_list(lists:last(Exprs)) of
        [macro,{_var,Anno,_MACRO} | _] ->
            {anno, Anno};
        [T,ExprAnno | Exprs1] ->
            case erl_anno:is_anno(ExprAnno) of
                true ->
                    {anno, ExprAnno};
                false when T =:= tree ->
                    {tree, Exprs1};
                false ->
                    unknown
            end
    end.

%%%-----------------------------------------------------------------
%%% Add a link target for each line and one for each function definition.
build_html(SFd,DFd,Encoding,FuncsAndCs) ->
    build_html(SFd,DFd,Encoding,file:read_line(SFd),1,FuncsAndCs,
	       false,undefined).

%% line of last expression in function found
build_html(SFd,DFd,Enc,{ok,Str},LastL,FuncsAndCs,_IsFuncDef,{F,LastL}) ->
    LastLineLink = test_server_ctrl:uri_encode(F++"-last_expr",utf8),
	    ok = file:write(DFd,["<a name=\"",
				 to_raw_list(LastLineLink,Enc),"\"/>"]),
    build_html(SFd,DFd,Enc,{ok,Str},LastL,FuncsAndCs,true,undefined);
%% function start line found
build_html(SFd,DFd,Enc,{ok,Str},L0,[{F,A,L0,LastL}|FuncsAndCs],
	   _IsFuncDef,_FAndLastL) ->
    FALink = test_server_ctrl:uri_encode(F++"-"++integer_to_list(A),utf8),
    ok = file:write(DFd,["<a name=\"",to_raw_list(FALink,Enc),"\"/>"]),
    build_html(SFd,DFd,Enc,{ok,Str},L0,FuncsAndCs,true,{F,LastL});
build_html(SFd,DFd,Enc,{ok,Str},L,[{clause,L}|FuncsAndCs],
	   _IsFuncDef,FAndLastL) ->
    build_html(SFd,DFd,Enc,{ok,Str},L,FuncsAndCs,true,FAndLastL);
build_html(SFd,DFd,Enc,{ok,Str},L,FuncsAndCs,IsFuncDef,FAndLastL) ->
    LStr = line_number(L),
    Str1 = line(Str,IsFuncDef),
    ok = file:write(DFd,[LStr,Str1]),
    build_html(SFd,DFd,Enc,file:read_line(SFd),L+1,FuncsAndCs,false,FAndLastL);
build_html(_SFd,_DFd,_Enc,eof,L,_FuncsAndCs,_IsFuncDef,_FAndLastL) ->
    L.

line_number(L) ->
    LStr = integer_to_list(L),
    Pred =
	case length(LStr) of
	    Length when Length < 5 ->
		lists:duplicate(5-Length,$\s);
	    _ -> 
		[]
	end, 
    ["<a name=\"",LStr,"\"/>",Pred,LStr,": "].

line(Str,IsFuncDef) ->
    Str1 = htmlize(Str),
    possibly_enhance(Str1,IsFuncDef).

%%%-----------------------------------------------------------------
%%% Substitute special characters that should not appear in HTML
htmlize([$<|Str]) ->
    [$&,$l,$t,$;|htmlize(Str)];
htmlize([$>|Str]) ->
    [$&,$g,$t,$;|htmlize(Str)];
htmlize([$&|Str]) ->
    [$&,$a,$m,$p,$;|htmlize(Str)];
htmlize([$"|Str]) ->
    [$&,$q,$u,$o,$t,$;|htmlize(Str)];
htmlize([Ch|Str]) ->
    [Ch|htmlize(Str)];
htmlize([]) ->
    [].

%%%-----------------------------------------------------------------
%%% Write comments in italic and function definitions in bold.
possibly_enhance(Str,true) ->
    case lists:splitwith(fun($() -> false; (_) -> true end, Str) of
	{_,[]} -> Str;
	{F,A} -> ["<b>",F,"</b>",A]
    end;
possibly_enhance([$%|_]=Str,_) ->
    ["<i>",Str--"\n","</i>","\n"];
possibly_enhance([$-|_]=Str,_) ->
    possibly_enhance(Str,true);
possibly_enhance(Str,false) ->
    Str.

%%%-----------------------------------------------------------------
%%% End of the file
footer() ->
    %% If the URL has an anchor part at the end (# with line number),
    %% color that line to make it easier to find on the screen.
    "<script>\n"
    "var hash = window.location.hash.substring(1);\n"
    "var anchor = document.getElementsByName(hash);\n"
    "anchor[0].style.backgroundColor=\"orange\";\n"
    "</script>\n".

%%%-----------------------------------------------------------------
%%% Read encoding from source file
encoding(File) ->
    case epp:read_encoding(File) of
	none ->
	    epp:default_encoding();
	E ->
	    E
    end.

%%%-----------------------------------------------------------------
%%% Convert encoding atom to string for use in HTML header
html_encoding(latin1) ->
    "iso-8859-1";
html_encoding(utf8) ->
    "utf-8".

%%%-----------------------------------------------------------------
%%% Convert a string to a list of raw printable characters in the
%%% given encoding.  This is necessary since the files (source and
%%% destination) are both opened in raw mode (default encoding). Byte
%%% by byte is read from source and written to the destination. This
%%% conversion is needed when printing data that is not first read
%%% from the source.
%%%
%%% Example: if the encoding of the file is utf8, and we have a string
%%% containing "å" = [229], then we need to convert this to [195,165]
%%% before writing. Note that this conversion is only necessary
%%% because the destination file is not (necessarily) opened with utf8
%%% encoding - it is opened with default encoding in order to allow
%%% raw file mode and byte by byte copying from source.
to_raw_list(X,latin1) when is_list(X) ->
    X;
to_raw_list(X,utf8) when is_list(X) ->
    binary_to_list(unicode:characters_to_binary(X)).
