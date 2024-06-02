%%
%% %CopyrightBegin%
%%
%% Copyright Ericsson AB 2008-2024. All Rights Reserved.
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
%% This file is generated DO NOT EDIT

-module(wxWebView).
-moduledoc """
Functions for wxWebView class

This control may be used to render web (HTML / CSS / javascript) documents. It
is designed to allow the creation of multiple backends for each port, although
currently just one is available. It differs from `m:wxHtmlWindow` in that each
backend is actually a full rendering engine, Trident on MSW and Webkit on macOS
and GTK. This allows the correct viewing of complex pages with javascript and
css.

Backend Descriptions

Par: The IE backend uses Microsoft's Trident rendering engine, specifically the
version used by the locally installed copy of Internet Explorer. As such it is
only available for the MSW port. By default recent versions of the
[WebBrowser](http://msdn.microsoft.com/en-us/library/aa752085%28v=VS.85%29.aspx)
control, which this backend uses, emulate Internet Explorer 7. This can be
changed with a registry setting by wxWebView::MSWSetEmulationLevel() see
[this](http://msdn.microsoft.com/en-us/library/ee330730%28v=vs.85%29.aspx#browser_emulation)
article for more information. This backend has full support for custom schemes
and virtual file systems.

Par: The Edge (Chromium) backend uses Microsoft's
[Edge WebView2](https://docs.microsoft.com/en-us/microsoft-edge/hosting/webview2).
It is available for Windows 7 and newer. The following features are currently
unsupported with this backend: virtual filesystems, custom urls, find.

This backend is not enabled by default, to build it follow these steps:

Par: Under GTK the WebKit backend uses [WebKitGTK+](http://webkitgtk.org/). The
current minimum version required is 1.3.1 which ships by default with Ubuntu
Natty and Debian Wheezy and has the package name libwebkitgtk-dev. Custom
schemes and virtual files systems are supported under this backend, however
embedded resources such as images and stylesheets are currently loaded using the
data:// scheme.

Par: Under GTK3 the WebKit2 version of [WebKitGTK+](http://webkitgtk.org/) is
used. In Ubuntu the required package name is libwebkit2gtk-4.0-dev and under
Fedora it is webkitgtk4-devel. All wxWEBVIEW_WEBKIT features are supported
except for clearing and enabling / disabling the history.

Par: The macOS WebKit backend uses Apple's
[WebView](http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/WebKit/Classes/WebView_Class/Reference/Reference.html#//apple_ref/doc/uid/20001903)
class. This backend has full support for custom schemes and virtual file
systems.

Asynchronous Notifications

Many of the methods in `m:wxWebView` are asynchronous, i.e. they return
immediately and perform their work in the background. This includes functions
such as `loadURL/2` and `reload/2`. To receive notification of the progress and
completion of these functions you need to handle the events that are provided.
Specifically `wxEVT_WEBVIEW_LOADED` notifies when the page or a sub-frame has
finished loading and `wxEVT_WEBVIEW_ERROR` notifies that an error has occurred.

Virtual File Systems and Custom Schemes

`m:wxWebView` supports the registering of custom scheme handlers, for example
`file` or `http`. To do this create a new class which inherits from
`wxWebViewHandler` (not implemented in wx), where wxWebHandler::GetFile()
returns a pointer to a `wxFSFile` (not implemented in wx) which represents the
given url. You can then register your handler with `RegisterHandler()` (not
implemented in wx) it will be called for all pages and resources.

`wxWebViewFSHandler` (not implemented in wx) is provided to access the virtual
file system encapsulated by `wxFileSystem` (not implemented in wx). The
`wxMemoryFSHandler` (not implemented in wx) documentation gives an example of
how this may be used.

`wxWebViewArchiveHandler` (not implemented in wx) is provided to allow the
navigation of pages inside a zip archive. It supports paths of the form:
`scheme:///C`:/example/docs.zip;protocol=zip/main.htm

Since: 2.9.3

See: `wxWebViewHandler` (not implemented in wx), `m:wxWebViewEvent`

This class is derived (and can use functions) from: `m:wxControl` `m:wxWindow`
`m:wxEvtHandler`

wxWidgets docs:
[wxWebView](https://docs.wxwidgets.org/3.1/classwx_web_view.html)

## Events

Event types emitted from this class: [`webview_navigating`](`m:wxWebViewEvent`),
[`webview_navigated`](`m:wxWebViewEvent`),
[`webview_loaded`](`m:wxWebViewEvent`), [`webview_error`](`m:wxWebViewEvent`),
[`webview_newwindow`](`m:wxWebViewEvent`),
[`webview_title_changed`](`m:wxWebViewEvent`)
""".
-include("wxe.hrl").
-export([canCopy/1,canCut/1,canGoBack/1,canGoForward/1,canPaste/1,canRedo/1,
  canSetZoomType/2,canUndo/1,clearHistory/1,clearSelection/1,copy/1,
  cut/1,deleteSelection/1,enableContextMenu/1,enableContextMenu/2,enableHistory/1,
  enableHistory/2,find/2,find/3,getCurrentTitle/1,getCurrentURL/1,getPageSource/1,
  getPageText/1,getSelectedSource/1,getSelectedText/1,getZoom/1,getZoomFactor/1,
  getZoomType/1,goBack/1,goForward/1,hasSelection/1,isBackendAvailable/1,
  isBusy/1,isContextMenuEnabled/1,isEditable/1,loadURL/2,new/2,new/3,
  paste/1,print/1,redo/1,reload/1,reload/2,runScript/2,selectAll/1,setEditable/1,
  setEditable/2,setPage/3,setZoom/2,setZoomFactor/2,setZoomType/2,stop/1,
  undo/1]).

%% inherited exports
-export([cacheBestSize/2,canSetTransparent/1,captureMouse/1,center/1,center/2,
  centerOnParent/1,centerOnParent/2,centre/1,centre/2,centreOnParent/1,
  centreOnParent/2,clearBackground/1,clientToScreen/2,clientToScreen/3,
  close/1,close/2,connect/2,connect/3,convertDialogToPixels/2,convertPixelsToDialog/2,
  destroyChildren/1,disable/1,disconnect/1,disconnect/2,disconnect/3,
  dragAcceptFiles/2,enable/1,enable/2,findWindow/2,fit/1,fitInside/1,
  freeze/1,getAcceleratorTable/1,getBackgroundColour/1,getBackgroundStyle/1,
  getBestSize/1,getCaret/1,getCharHeight/1,getCharWidth/1,getChildren/1,
  getClientSize/1,getContainingSizer/1,getContentScaleFactor/1,getCursor/1,
  getDPI/1,getDPIScaleFactor/1,getDropTarget/1,getExtraStyle/1,getFont/1,
  getForegroundColour/1,getGrandParent/1,getHandle/1,getHelpText/1,
  getId/1,getLabel/1,getMaxSize/1,getMinSize/1,getName/1,getParent/1,
  getPosition/1,getRect/1,getScreenPosition/1,getScreenRect/1,getScrollPos/2,
  getScrollRange/2,getScrollThumb/2,getSize/1,getSizer/1,getTextExtent/2,
  getTextExtent/3,getThemeEnabled/1,getToolTip/1,getUpdateRegion/1,
  getVirtualSize/1,getWindowStyleFlag/1,getWindowVariant/1,hasCapture/1,
  hasScrollbar/2,hasTransparentBackground/1,hide/1,inheritAttributes/1,
  initDialog/1,invalidateBestSize/1,isDoubleBuffered/1,isEnabled/1,
  isExposed/2,isExposed/3,isExposed/5,isFrozen/1,isRetained/1,isShown/1,
  isShownOnScreen/1,isTopLevel/1,layout/1,lineDown/1,lineUp/1,lower/1,
  move/2,move/3,move/4,moveAfterInTabOrder/2,moveBeforeInTabOrder/2,
  navigate/1,navigate/2,pageDown/1,pageUp/1,parent_class/1,popupMenu/2,
  popupMenu/3,popupMenu/4,raise/1,refresh/1,refresh/2,refreshRect/2,refreshRect/3,
  releaseMouse/1,removeChild/2,reparent/2,screenToClient/1,screenToClient/2,
  scrollLines/2,scrollPages/2,scrollWindow/3,scrollWindow/4,setAcceleratorTable/2,
  setAutoLayout/2,setBackgroundColour/2,setBackgroundStyle/2,setCaret/2,
  setClientSize/2,setClientSize/3,setContainingSizer/2,setCursor/2,
  setDoubleBuffered/2,setDropTarget/2,setExtraStyle/2,setFocus/1,setFocusFromKbd/1,
  setFont/2,setForegroundColour/2,setHelpText/2,setId/2,setLabel/2,setMaxSize/2,
  setMinSize/2,setName/2,setOwnBackgroundColour/2,setOwnFont/2,setOwnForegroundColour/2,
  setPalette/2,setScrollPos/3,setScrollPos/4,setScrollbar/5,setScrollbar/6,
  setSize/2,setSize/3,setSize/5,setSize/6,setSizeHints/2,setSizeHints/3,
  setSizeHints/4,setSizer/2,setSizer/3,setSizerAndFit/2,setSizerAndFit/3,
  setThemeEnabled/2,setToolTip/2,setTransparent/2,setVirtualSize/2,
  setVirtualSize/3,setWindowStyle/2,setWindowStyleFlag/2,setWindowVariant/2,
  shouldInheritColours/1,show/1,show/2,thaw/1,transferDataFromWindow/1,
  transferDataToWindow/1,update/1,updateWindowUI/1,updateWindowUI/2,
  validate/1,warpPointer/3]).

-type wxWebView() :: wx:wx_object().
-export_type([wxWebView/0]).
%% @hidden
-doc false.
parent_class(wxControl) -> true;
parent_class(wxWindow) -> true;
parent_class(wxEvtHandler) -> true;
parent_class(_Class) -> erlang:error({badtype, ?MODULE}).

%% @equiv new(Parent,Id, [])
-spec new(Parent, Id) -> wxWebView() when
	Parent::wxWindow:wxWindow(), Id::integer().

new(Parent,Id)
 when is_record(Parent, wx_ref),is_integer(Id) ->
  new(Parent,Id, []).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewnew">external documentation</a>.
-doc """
Factory function to create a new `m:wxWebView` using a `wxWebViewFactory` (not
implemented in wx).

Return: The created `m:wxWebView`, or `NULL` if the requested backend is not
available

Since: 2.9.5
""".
-spec new(Parent, Id, [Option]) -> wxWebView() when
	Parent::wxWindow:wxWindow(), Id::integer(),
	Option :: {'url', unicode:chardata()}
		 | {'pos', {X::integer(), Y::integer()}}
		 | {'size', {W::integer(), H::integer()}}
		 | {'backend', unicode:chardata()}
		 | {'style', integer()}.
new(#wx_ref{type=ParentT}=Parent,Id, Options)
 when is_integer(Id),is_list(Options) ->
  ?CLASS(ParentT,wxWindow),
  MOpts = fun({url, Url}) ->   Url_UC = unicode:characters_to_binary(Url),{url,Url_UC};
          ({pos, {_posX,_posY}} = Arg) -> Arg;
          ({size, {_sizeW,_sizeH}} = Arg) -> Arg;
          ({backend, Backend}) ->   Backend_UC = unicode:characters_to_binary(Backend),{backend,Backend_UC};
          ({style, _style} = Arg) -> Arg;
          (BadOpt) -> erlang:error({badoption, BadOpt}) end,
  Opts = lists:map(MOpts, Options),
  wxe_util:queue_cmd(Parent,Id, Opts,?get_env(),?wxWebView_New),
  wxe_util:rec(?wxWebView_New).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewgetcurrenttitle">external documentation</a>.
-doc """
Get the title of the current web page, or its URL/path if title is not
available.
""".
-spec getCurrentTitle(This) -> unicode:charlist() when
	This::wxWebView().
getCurrentTitle(#wx_ref{type=ThisT}=This) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,?get_env(),?wxWebView_GetCurrentTitle),
  wxe_util:rec(?wxWebView_GetCurrentTitle).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewgetcurrenturl">external documentation</a>.
-doc "Get the URL of the currently displayed document.".
-spec getCurrentURL(This) -> unicode:charlist() when
	This::wxWebView().
getCurrentURL(#wx_ref{type=ThisT}=This) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,?get_env(),?wxWebView_GetCurrentURL),
  wxe_util:rec(?wxWebView_GetCurrentURL).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewgetpagesource">external documentation</a>.
-doc """
Get the HTML source code of the currently displayed document.

Return: The HTML source code, or an empty string if no page is currently shown.
""".
-spec getPageSource(This) -> unicode:charlist() when
	This::wxWebView().
getPageSource(#wx_ref{type=ThisT}=This) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,?get_env(),?wxWebView_GetPageSource),
  wxe_util:rec(?wxWebView_GetPageSource).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewgetpagetext">external documentation</a>.
-doc "Get the text of the current page.".
-spec getPageText(This) -> unicode:charlist() when
	This::wxWebView().
getPageText(#wx_ref{type=ThisT}=This) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,?get_env(),?wxWebView_GetPageText),
  wxe_util:rec(?wxWebView_GetPageText).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewisbusy">external documentation</a>.
-doc "Returns whether the web control is currently busy (e.g. loading a page).".
-spec isBusy(This) -> boolean() when
	This::wxWebView().
isBusy(#wx_ref{type=ThisT}=This) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,?get_env(),?wxWebView_IsBusy),
  wxe_util:rec(?wxWebView_IsBusy).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewiseditable">external documentation</a>.
-doc "Returns whether the web control is currently editable.".
-spec isEditable(This) -> boolean() when
	This::wxWebView().
isEditable(#wx_ref{type=ThisT}=This) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,?get_env(),?wxWebView_IsEditable),
  wxe_util:rec(?wxWebView_IsEditable).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewloadurl">external documentation</a>.
-doc """
Load a web page from a URL.

Note: Web engines generally report errors asynchronously, so if you wish to know
whether loading the URL was successful, register to receive navigation error
events.
""".
-spec loadURL(This, Url) -> 'ok' when
	This::wxWebView(), Url::unicode:chardata().
loadURL(#wx_ref{type=ThisT}=This,Url)
 when ?is_chardata(Url) ->
  ?CLASS(ThisT,wxWebView),
  Url_UC = unicode:characters_to_binary(Url),
  wxe_util:queue_cmd(This,Url_UC,?get_env(),?wxWebView_LoadURL).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewprint">external documentation</a>.
-doc "Opens a print dialog so that the user may print the currently displayed page.".
-spec print(This) -> 'ok' when
	This::wxWebView().
print(#wx_ref{type=ThisT}=This) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,?get_env(),?wxWebView_Print).

%% @equiv reload(This, [])
-spec reload(This) -> 'ok' when
	This::wxWebView().

reload(This)
 when is_record(This, wx_ref) ->
  reload(This, []).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewreload">external documentation</a>.
%%<br /> Flags = ?wxWEBVIEW_RELOAD_DEFAULT | ?wxWEBVIEW_RELOAD_NO_CACHE
-doc """
Reload the currently displayed URL.

Note: The flags are ignored by the edge backend.
""".
-spec reload(This, [Option]) -> 'ok' when
	This::wxWebView(),
	Option :: {'flags', wx:wx_enum()}.
reload(#wx_ref{type=ThisT}=This, Options)
 when is_list(Options) ->
  ?CLASS(ThisT,wxWebView),
  MOpts = fun({flags, _flags} = Arg) -> Arg;
          (BadOpt) -> erlang:error({badoption, BadOpt}) end,
  Opts = lists:map(MOpts, Options),
  wxe_util:queue_cmd(This, Opts,?get_env(),?wxWebView_Reload).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewrunscript">external documentation</a>.
-doc """
Runs the given JavaScript code.

JavaScript code is executed inside the browser control and has full access to
DOM and other browser-provided functionality. For example, this code will
replace the current page contents with the provided string.

If `output` is non-null, it is filled with the result of executing this code on
success, e.g. a JavaScript value such as a string, a number (integer or floating
point), a boolean or JSON representation for non-primitive types such as arrays
and objects. For example:

This function has a few platform-specific limitations:

Also notice that under MSW converting JavaScript objects to JSON is not
supported in the default emulation mode. `m:wxWebView` implements its own
object-to-JSON conversion as a fallback for this case, however it is not as
full-featured, well-tested or performing as the implementation of this
functionality in the browser control itself, so it is recommended to use
MSWSetEmulationLevel() to change emulation level to a more modern one in which
JSON conversion is done by the control itself.

Return: true if there is a result, false if there is an error.
""".
-spec runScript(This, Javascript) -> Result when
	Result ::{Res ::boolean(), Output::unicode:charlist()},
	This::wxWebView(), Javascript::unicode:chardata().
runScript(#wx_ref{type=ThisT}=This,Javascript)
 when ?is_chardata(Javascript) ->
  ?CLASS(ThisT,wxWebView),
  Javascript_UC = unicode:characters_to_binary(Javascript),
  wxe_util:queue_cmd(This,Javascript_UC,?get_env(),?wxWebView_RunScript),
  wxe_util:rec(?wxWebView_RunScript).

%% @equiv setEditable(This, [])
-spec setEditable(This) -> 'ok' when
	This::wxWebView().

setEditable(This)
 when is_record(This, wx_ref) ->
  setEditable(This, []).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewseteditable">external documentation</a>.
-doc """
Set the editable property of the web control.

Enabling allows the user to edit the page even if the `contenteditable`
attribute is not set. The exact capabilities vary with the backend being used.
""".
-spec setEditable(This, [Option]) -> 'ok' when
	This::wxWebView(),
	Option :: {'enable', boolean()}.
setEditable(#wx_ref{type=ThisT}=This, Options)
 when is_list(Options) ->
  ?CLASS(ThisT,wxWebView),
  MOpts = fun({enable, _enable} = Arg) -> Arg;
          (BadOpt) -> erlang:error({badoption, BadOpt}) end,
  Opts = lists:map(MOpts, Options),
  wxe_util:queue_cmd(This, Opts,?get_env(),?wxWebView_SetEditable).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewsetpage">external documentation</a>.
-doc """
Set the displayed page source to the contents of the given string.

Note: When using `wxWEBVIEW_BACKEND_IE` you must wait for the current page to
finish loading before calling `setPage/3`. The baseURL parameter is not used in
this backend and the edge backend.
""".
-spec setPage(This, Html, BaseUrl) -> 'ok' when
	This::wxWebView(), Html::unicode:chardata(), BaseUrl::unicode:chardata().
setPage(#wx_ref{type=ThisT}=This,Html,BaseUrl)
 when ?is_chardata(Html),?is_chardata(BaseUrl) ->
  ?CLASS(ThisT,wxWebView),
  Html_UC = unicode:characters_to_binary(Html),
  BaseUrl_UC = unicode:characters_to_binary(BaseUrl),
  wxe_util:queue_cmd(This,Html_UC,BaseUrl_UC,?get_env(),?wxWebView_SetPage).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewstop">external documentation</a>.
-doc """
Stop the current page loading process, if any.

May trigger an error event of type `wxWEBVIEW_NAV_ERR_USER_CANCELLED`. TODO:
make `wxWEBVIEW_NAV_ERR_USER_CANCELLED` errors uniform across ports.
""".
-spec stop(This) -> 'ok' when
	This::wxWebView().
stop(#wx_ref{type=ThisT}=This) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,?get_env(),?wxWebView_Stop).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewcancopy">external documentation</a>.
-doc """
Returns true if the current selection can be copied.

Note: This always returns `true` on the macOS WebKit backend.
""".
-spec canCopy(This) -> boolean() when
	This::wxWebView().
canCopy(#wx_ref{type=ThisT}=This) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,?get_env(),?wxWebView_CanCopy),
  wxe_util:rec(?wxWebView_CanCopy).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewcancut">external documentation</a>.
-doc """
Returns true if the current selection can be cut.

Note: This always returns `true` on the macOS WebKit backend.
""".
-spec canCut(This) -> boolean() when
	This::wxWebView().
canCut(#wx_ref{type=ThisT}=This) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,?get_env(),?wxWebView_CanCut),
  wxe_util:rec(?wxWebView_CanCut).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewcanpaste">external documentation</a>.
-doc """
Returns true if data can be pasted.

Note: This always returns `true` on the macOS WebKit backend.
""".
-spec canPaste(This) -> boolean() when
	This::wxWebView().
canPaste(#wx_ref{type=ThisT}=This) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,?get_env(),?wxWebView_CanPaste),
  wxe_util:rec(?wxWebView_CanPaste).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewcopy">external documentation</a>.
-doc "Copies the current selection.".
-spec copy(This) -> 'ok' when
	This::wxWebView().
copy(#wx_ref{type=ThisT}=This) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,?get_env(),?wxWebView_Copy).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewcut">external documentation</a>.
-doc "Cuts the current selection.".
-spec cut(This) -> 'ok' when
	This::wxWebView().
cut(#wx_ref{type=ThisT}=This) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,?get_env(),?wxWebView_Cut).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewpaste">external documentation</a>.
-doc "Pastes the current data.".
-spec paste(This) -> 'ok' when
	This::wxWebView().
paste(#wx_ref{type=ThisT}=This) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,?get_env(),?wxWebView_Paste).

%% @equiv enableContextMenu(This, [])
-spec enableContextMenu(This) -> 'ok' when
	This::wxWebView().

enableContextMenu(This)
 when is_record(This, wx_ref) ->
  enableContextMenu(This, []).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewenablecontextmenu">external documentation</a>.
-doc """
Enable or disable the right click context menu.

By default the standard context menu is enabled, this method can be used to
disable it or re-enable it later.

Since: 2.9.5
""".
-spec enableContextMenu(This, [Option]) -> 'ok' when
	This::wxWebView(),
	Option :: {'enable', boolean()}.
enableContextMenu(#wx_ref{type=ThisT}=This, Options)
 when is_list(Options) ->
  ?CLASS(ThisT,wxWebView),
  MOpts = fun({enable, _enable} = Arg) -> Arg;
          (BadOpt) -> erlang:error({badoption, BadOpt}) end,
  Opts = lists:map(MOpts, Options),
  wxe_util:queue_cmd(This, Opts,?get_env(),?wxWebView_EnableContextMenu).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewiscontextmenuenabled">external documentation</a>.
-doc """
Returns true if a context menu will be shown on right click.

Since: 2.9.5
""".
-spec isContextMenuEnabled(This) -> boolean() when
	This::wxWebView().
isContextMenuEnabled(#wx_ref{type=ThisT}=This) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,?get_env(),?wxWebView_IsContextMenuEnabled),
  wxe_util:rec(?wxWebView_IsContextMenuEnabled).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewcangoback">external documentation</a>.
-doc """
Returns true if it is possible to navigate backward in the history of visited
pages.
""".
-spec canGoBack(This) -> boolean() when
	This::wxWebView().
canGoBack(#wx_ref{type=ThisT}=This) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,?get_env(),?wxWebView_CanGoBack),
  wxe_util:rec(?wxWebView_CanGoBack).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewcangoforward">external documentation</a>.
-doc """
Returns true if it is possible to navigate forward in the history of visited
pages.
""".
-spec canGoForward(This) -> boolean() when
	This::wxWebView().
canGoForward(#wx_ref{type=ThisT}=This) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,?get_env(),?wxWebView_CanGoForward),
  wxe_util:rec(?wxWebView_CanGoForward).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewclearhistory">external documentation</a>.
-doc """
Clear the history, this will also remove the visible page.

Note: This is not implemented on the WebKit2GTK+ backend.
""".
-spec clearHistory(This) -> 'ok' when
	This::wxWebView().
clearHistory(#wx_ref{type=ThisT}=This) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,?get_env(),?wxWebView_ClearHistory).

%% @equiv enableHistory(This, [])
-spec enableHistory(This) -> 'ok' when
	This::wxWebView().

enableHistory(This)
 when is_record(This, wx_ref) ->
  enableHistory(This, []).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewenablehistory">external documentation</a>.
-doc """
Enable or disable the history.

This will also clear the history.

Note: This is not implemented on the WebKit2GTK+ backend.
""".
-spec enableHistory(This, [Option]) -> 'ok' when
	This::wxWebView(),
	Option :: {'enable', boolean()}.
enableHistory(#wx_ref{type=ThisT}=This, Options)
 when is_list(Options) ->
  ?CLASS(ThisT,wxWebView),
  MOpts = fun({enable, _enable} = Arg) -> Arg;
          (BadOpt) -> erlang:error({badoption, BadOpt}) end,
  Opts = lists:map(MOpts, Options),
  wxe_util:queue_cmd(This, Opts,?get_env(),?wxWebView_EnableHistory).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewgoback">external documentation</a>.
-doc """
Navigate back in the history of visited pages.

Only valid if `canGoBack/1` returns true.
""".
-spec goBack(This) -> 'ok' when
	This::wxWebView().
goBack(#wx_ref{type=ThisT}=This) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,?get_env(),?wxWebView_GoBack).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewgoforward">external documentation</a>.
-doc """
Navigate forward in the history of visited pages.

Only valid if `canGoForward/1` returns true.
""".
-spec goForward(This) -> 'ok' when
	This::wxWebView().
goForward(#wx_ref{type=ThisT}=This) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,?get_env(),?wxWebView_GoForward).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewclearselection">external documentation</a>.
-doc "Clears the current selection.".
-spec clearSelection(This) -> 'ok' when
	This::wxWebView().
clearSelection(#wx_ref{type=ThisT}=This) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,?get_env(),?wxWebView_ClearSelection).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewdeleteselection">external documentation</a>.
-doc """
Deletes the current selection.

Note that for `wxWEBVIEW_BACKEND_WEBKIT` the selection must be editable, either
through SetEditable or the correct HTML attribute.
""".
-spec deleteSelection(This) -> 'ok' when
	This::wxWebView().
deleteSelection(#wx_ref{type=ThisT}=This) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,?get_env(),?wxWebView_DeleteSelection).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewgetselectedsource">external documentation</a>.
-doc "Returns the currently selected source, if any.".
-spec getSelectedSource(This) -> unicode:charlist() when
	This::wxWebView().
getSelectedSource(#wx_ref{type=ThisT}=This) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,?get_env(),?wxWebView_GetSelectedSource),
  wxe_util:rec(?wxWebView_GetSelectedSource).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewgetselectedtext">external documentation</a>.
-doc "Returns the currently selected text, if any.".
-spec getSelectedText(This) -> unicode:charlist() when
	This::wxWebView().
getSelectedText(#wx_ref{type=ThisT}=This) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,?get_env(),?wxWebView_GetSelectedText),
  wxe_util:rec(?wxWebView_GetSelectedText).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewhasselection">external documentation</a>.
-doc "Returns true if there is a current selection.".
-spec hasSelection(This) -> boolean() when
	This::wxWebView().
hasSelection(#wx_ref{type=ThisT}=This) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,?get_env(),?wxWebView_HasSelection),
  wxe_util:rec(?wxWebView_HasSelection).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewselectall">external documentation</a>.
-doc "Selects the entire page.".
-spec selectAll(This) -> 'ok' when
	This::wxWebView().
selectAll(#wx_ref{type=ThisT}=This) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,?get_env(),?wxWebView_SelectAll).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewcanredo">external documentation</a>.
-doc "Returns true if there is an action to redo.".
-spec canRedo(This) -> boolean() when
	This::wxWebView().
canRedo(#wx_ref{type=ThisT}=This) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,?get_env(),?wxWebView_CanRedo),
  wxe_util:rec(?wxWebView_CanRedo).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewcanundo">external documentation</a>.
-doc "Returns true if there is an action to undo.".
-spec canUndo(This) -> boolean() when
	This::wxWebView().
canUndo(#wx_ref{type=ThisT}=This) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,?get_env(),?wxWebView_CanUndo),
  wxe_util:rec(?wxWebView_CanUndo).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewredo">external documentation</a>.
-doc "Redos the last action.".
-spec redo(This) -> 'ok' when
	This::wxWebView().
redo(#wx_ref{type=ThisT}=This) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,?get_env(),?wxWebView_Redo).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewundo">external documentation</a>.
-doc "Undos the last action.".
-spec undo(This) -> 'ok' when
	This::wxWebView().
undo(#wx_ref{type=ThisT}=This) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,?get_env(),?wxWebView_Undo).

%% @equiv find(This,Text, [])
-spec find(This, Text) -> integer() when
	This::wxWebView(), Text::unicode:chardata().

find(This,Text)
 when is_record(This, wx_ref),?is_chardata(Text) ->
  find(This,Text, []).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewfind">external documentation</a>.
%%<br /> Flags = ?wxWEBVIEW_FIND_WRAP | ?wxWEBVIEW_FIND_ENTIRE_WORD | ?wxWEBVIEW_FIND_MATCH_CASE | ?wxWEBVIEW_FIND_HIGHLIGHT_RESULT | ?wxWEBVIEW_FIND_BACKWARDS | ?wxWEBVIEW_FIND_DEFAULT
-doc """
Finds a phrase on the current page and if found, the control will scroll the
phrase into view and select it.

Return: If search phrase was not found in combination with the flags then
`wxNOT_FOUND` is returned. If called for the first time with search phrase then
the total number of results will be returned. Then for every time its called
with the same search phrase it will return the number of the current match.

Note: This function will restart the search if the flags
`wxWEBVIEW_FIND_ENTIRE_WORD` or `wxWEBVIEW_FIND_MATCH_CASE` are changed, since
this will require a new search. To reset the search, for example resetting the
highlights call the function with an empty search phrase. This always returns
`wxNOT_FOUND` on the macOS WebKit backend.

Since: 2.9.5
""".
-spec find(This, Text, [Option]) -> integer() when
	This::wxWebView(), Text::unicode:chardata(),
	Option :: {'flags', wx:wx_enum()}.
find(#wx_ref{type=ThisT}=This,Text, Options)
 when ?is_chardata(Text),is_list(Options) ->
  ?CLASS(ThisT,wxWebView),
  Text_UC = unicode:characters_to_binary(Text),
  MOpts = fun({flags, _flags} = Arg) -> Arg;
          (BadOpt) -> erlang:error({badoption, BadOpt}) end,
  Opts = lists:map(MOpts, Options),
  wxe_util:queue_cmd(This,Text_UC, Opts,?get_env(),?wxWebView_Find),
  wxe_util:rec(?wxWebView_Find).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewcansetzoomtype">external documentation</a>.
%%<br /> Type = ?wxWEBVIEW_ZOOM_TYPE_LAYOUT | ?wxWEBVIEW_ZOOM_TYPE_TEXT
-doc """
Retrieve whether the current HTML engine supports a zoom type.

Return: Whether this type of zoom is supported by this HTML engine (and thus can
be set through `setZoomType/2`).
""".
-spec canSetZoomType(This, Type) -> boolean() when
	This::wxWebView(), Type::wx:wx_enum().
canSetZoomType(#wx_ref{type=ThisT}=This,Type)
 when is_integer(Type) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,Type,?get_env(),?wxWebView_CanSetZoomType),
  wxe_util:rec(?wxWebView_CanSetZoomType).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewgetzoom">external documentation</a>.
%%<br /> Res = ?wxWEBVIEW_ZOOM_TINY | ?wxWEBVIEW_ZOOM_SMALL | ?wxWEBVIEW_ZOOM_MEDIUM | ?wxWEBVIEW_ZOOM_LARGE | ?wxWEBVIEW_ZOOM_LARGEST
-doc """
Get the zoom level of the page.

See `getZoomFactor/1` to get more precise zoom scale value other than as
provided by `wxWebViewZoom`.

Return: The current level of zoom.
""".
-spec getZoom(This) -> wx:wx_enum() when
	This::wxWebView().
getZoom(#wx_ref{type=ThisT}=This) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,?get_env(),?wxWebView_GetZoom),
  wxe_util:rec(?wxWebView_GetZoom).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewgetzoomtype">external documentation</a>.
%%<br /> Res = ?wxWEBVIEW_ZOOM_TYPE_LAYOUT | ?wxWEBVIEW_ZOOM_TYPE_TEXT
-doc """
Get how the zoom factor is currently interpreted.

Return: How the zoom factor is currently interpreted by the HTML engine.
""".
-spec getZoomType(This) -> wx:wx_enum() when
	This::wxWebView().
getZoomType(#wx_ref{type=ThisT}=This) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,?get_env(),?wxWebView_GetZoomType),
  wxe_util:rec(?wxWebView_GetZoomType).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewsetzoom">external documentation</a>.
%%<br /> Zoom = ?wxWEBVIEW_ZOOM_TINY | ?wxWEBVIEW_ZOOM_SMALL | ?wxWEBVIEW_ZOOM_MEDIUM | ?wxWEBVIEW_ZOOM_LARGE | ?wxWEBVIEW_ZOOM_LARGEST
-doc """
Set the zoom level of the page.

See `setZoomFactor/2` for more precise scaling other than the measured steps
provided by `wxWebViewZoom`.
""".
-spec setZoom(This, Zoom) -> 'ok' when
	This::wxWebView(), Zoom::wx:wx_enum().
setZoom(#wx_ref{type=ThisT}=This,Zoom)
 when is_integer(Zoom) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,Zoom,?get_env(),?wxWebView_SetZoom).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewsetzoomtype">external documentation</a>.
%%<br /> ZoomType = ?wxWEBVIEW_ZOOM_TYPE_LAYOUT | ?wxWEBVIEW_ZOOM_TYPE_TEXT
-doc """
Set how to interpret the zoom factor.

Note: invoke `canSetZoomType/2` first, some HTML renderers may not support all
zoom types.
""".
-spec setZoomType(This, ZoomType) -> 'ok' when
	This::wxWebView(), ZoomType::wx:wx_enum().
setZoomType(#wx_ref{type=ThisT}=This,ZoomType)
 when is_integer(ZoomType) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,ZoomType,?get_env(),?wxWebView_SetZoomType).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewgetzoomfactor">external documentation</a>.
-doc """
Get the zoom factor of the page.

Return: The current factor of zoom.

Since: 3.1.4
""".
-spec getZoomFactor(This) -> number() when
	This::wxWebView().
getZoomFactor(#wx_ref{type=ThisT}=This) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,?get_env(),?wxWebView_GetZoomFactor),
  wxe_util:rec(?wxWebView_GetZoomFactor).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewsetzoomfactor">external documentation</a>.
-doc """
Set the zoom factor of the page.

Note: zoom scale in IE will be converted into `wxWebViewZoom` levels for
`wxWebViewZoomType` of `wxWEBVIEW_ZOOM_TYPE_TEXT`.

Since: 3.1.4
""".
-spec setZoomFactor(This, Zoom) -> 'ok' when
	This::wxWebView(), Zoom::number().
setZoomFactor(#wx_ref{type=ThisT}=This,Zoom)
 when is_number(Zoom) ->
  ?CLASS(ThisT,wxWebView),
  wxe_util:queue_cmd(This,Zoom,?get_env(),?wxWebView_SetZoomFactor).

%% @doc See <a href="http://www.wxwidgets.org/manuals/2.8.12/wx_wxwebview.html#wxwebviewisbackendavailable">external documentation</a>.
-doc """
Allows to check if a specific backend is currently available.

Since: 3.1.4
""".
-spec isBackendAvailable(Backend) -> boolean() when
	Backend::unicode:chardata().
isBackendAvailable(Backend)
 when ?is_chardata(Backend) ->
  Backend_UC = unicode:characters_to_binary(Backend),
  wxe_util:queue_cmd(Backend_UC,?get_env(),?wxWebView_IsBackendAvailable),
  wxe_util:rec(?wxWebView_IsBackendAvailable).

 %% From wxControl
%% @hidden
-doc false.
setLabel(This,Label) -> wxControl:setLabel(This,Label).
%% @hidden
-doc false.
getLabel(This) -> wxControl:getLabel(This).
 %% From wxWindow
%% @hidden
-doc false.
getDPI(This) -> wxWindow:getDPI(This).
%% @hidden
-doc false.
getContentScaleFactor(This) -> wxWindow:getContentScaleFactor(This).
%% @hidden
-doc false.
setDoubleBuffered(This,On) -> wxWindow:setDoubleBuffered(This,On).
%% @hidden
-doc false.
isDoubleBuffered(This) -> wxWindow:isDoubleBuffered(This).
%% @hidden
-doc false.
canSetTransparent(This) -> wxWindow:canSetTransparent(This).
%% @hidden
-doc false.
setTransparent(This,Alpha) -> wxWindow:setTransparent(This,Alpha).
%% @hidden
-doc false.
warpPointer(This,X,Y) -> wxWindow:warpPointer(This,X,Y).
%% @hidden
-doc false.
validate(This) -> wxWindow:validate(This).
%% @hidden
-doc false.
updateWindowUI(This, Options) -> wxWindow:updateWindowUI(This, Options).
%% @hidden
-doc false.
updateWindowUI(This) -> wxWindow:updateWindowUI(This).
%% @hidden
-doc false.
update(This) -> wxWindow:update(This).
%% @hidden
-doc false.
transferDataToWindow(This) -> wxWindow:transferDataToWindow(This).
%% @hidden
-doc false.
transferDataFromWindow(This) -> wxWindow:transferDataFromWindow(This).
%% @hidden
-doc false.
thaw(This) -> wxWindow:thaw(This).
%% @hidden
-doc false.
show(This, Options) -> wxWindow:show(This, Options).
%% @hidden
-doc false.
show(This) -> wxWindow:show(This).
%% @hidden
-doc false.
shouldInheritColours(This) -> wxWindow:shouldInheritColours(This).
%% @hidden
-doc false.
setWindowVariant(This,Variant) -> wxWindow:setWindowVariant(This,Variant).
%% @hidden
-doc false.
setWindowStyleFlag(This,Style) -> wxWindow:setWindowStyleFlag(This,Style).
%% @hidden
-doc false.
setWindowStyle(This,Style) -> wxWindow:setWindowStyle(This,Style).
%% @hidden
-doc false.
setVirtualSize(This,Width,Height) -> wxWindow:setVirtualSize(This,Width,Height).
%% @hidden
-doc false.
setVirtualSize(This,Size) -> wxWindow:setVirtualSize(This,Size).
%% @hidden
-doc false.
setToolTip(This,TipString) -> wxWindow:setToolTip(This,TipString).
%% @hidden
-doc false.
setThemeEnabled(This,Enable) -> wxWindow:setThemeEnabled(This,Enable).
%% @hidden
-doc false.
setSizerAndFit(This,Sizer, Options) -> wxWindow:setSizerAndFit(This,Sizer, Options).
%% @hidden
-doc false.
setSizerAndFit(This,Sizer) -> wxWindow:setSizerAndFit(This,Sizer).
%% @hidden
-doc false.
setSizer(This,Sizer, Options) -> wxWindow:setSizer(This,Sizer, Options).
%% @hidden
-doc false.
setSizer(This,Sizer) -> wxWindow:setSizer(This,Sizer).
%% @hidden
-doc false.
setSizeHints(This,MinW,MinH, Options) -> wxWindow:setSizeHints(This,MinW,MinH, Options).
%% @hidden
-doc false.
setSizeHints(This,MinW,MinH) -> wxWindow:setSizeHints(This,MinW,MinH).
%% @hidden
-doc false.
setSizeHints(This,MinSize) -> wxWindow:setSizeHints(This,MinSize).
%% @hidden
-doc false.
setSize(This,X,Y,Width,Height, Options) -> wxWindow:setSize(This,X,Y,Width,Height, Options).
%% @hidden
-doc false.
setSize(This,X,Y,Width,Height) -> wxWindow:setSize(This,X,Y,Width,Height).
%% @hidden
-doc false.
setSize(This,Width,Height) -> wxWindow:setSize(This,Width,Height).
%% @hidden
-doc false.
setSize(This,Rect) -> wxWindow:setSize(This,Rect).
%% @hidden
-doc false.
setScrollPos(This,Orientation,Pos, Options) -> wxWindow:setScrollPos(This,Orientation,Pos, Options).
%% @hidden
-doc false.
setScrollPos(This,Orientation,Pos) -> wxWindow:setScrollPos(This,Orientation,Pos).
%% @hidden
-doc false.
setScrollbar(This,Orientation,Position,ThumbSize,Range, Options) -> wxWindow:setScrollbar(This,Orientation,Position,ThumbSize,Range, Options).
%% @hidden
-doc false.
setScrollbar(This,Orientation,Position,ThumbSize,Range) -> wxWindow:setScrollbar(This,Orientation,Position,ThumbSize,Range).
%% @hidden
-doc false.
setPalette(This,Pal) -> wxWindow:setPalette(This,Pal).
%% @hidden
-doc false.
setName(This,Name) -> wxWindow:setName(This,Name).
%% @hidden
-doc false.
setId(This,Winid) -> wxWindow:setId(This,Winid).
%% @hidden
-doc false.
setHelpText(This,HelpText) -> wxWindow:setHelpText(This,HelpText).
%% @hidden
-doc false.
setForegroundColour(This,Colour) -> wxWindow:setForegroundColour(This,Colour).
%% @hidden
-doc false.
setFont(This,Font) -> wxWindow:setFont(This,Font).
%% @hidden
-doc false.
setFocusFromKbd(This) -> wxWindow:setFocusFromKbd(This).
%% @hidden
-doc false.
setFocus(This) -> wxWindow:setFocus(This).
%% @hidden
-doc false.
setExtraStyle(This,ExStyle) -> wxWindow:setExtraStyle(This,ExStyle).
%% @hidden
-doc false.
setDropTarget(This,Target) -> wxWindow:setDropTarget(This,Target).
%% @hidden
-doc false.
setOwnForegroundColour(This,Colour) -> wxWindow:setOwnForegroundColour(This,Colour).
%% @hidden
-doc false.
setOwnFont(This,Font) -> wxWindow:setOwnFont(This,Font).
%% @hidden
-doc false.
setOwnBackgroundColour(This,Colour) -> wxWindow:setOwnBackgroundColour(This,Colour).
%% @hidden
-doc false.
setMinSize(This,Size) -> wxWindow:setMinSize(This,Size).
%% @hidden
-doc false.
setMaxSize(This,Size) -> wxWindow:setMaxSize(This,Size).
%% @hidden
-doc false.
setCursor(This,Cursor) -> wxWindow:setCursor(This,Cursor).
%% @hidden
-doc false.
setContainingSizer(This,Sizer) -> wxWindow:setContainingSizer(This,Sizer).
%% @hidden
-doc false.
setClientSize(This,Width,Height) -> wxWindow:setClientSize(This,Width,Height).
%% @hidden
-doc false.
setClientSize(This,Size) -> wxWindow:setClientSize(This,Size).
%% @hidden
-doc false.
setCaret(This,Caret) -> wxWindow:setCaret(This,Caret).
%% @hidden
-doc false.
setBackgroundStyle(This,Style) -> wxWindow:setBackgroundStyle(This,Style).
%% @hidden
-doc false.
setBackgroundColour(This,Colour) -> wxWindow:setBackgroundColour(This,Colour).
%% @hidden
-doc false.
setAutoLayout(This,AutoLayout) -> wxWindow:setAutoLayout(This,AutoLayout).
%% @hidden
-doc false.
setAcceleratorTable(This,Accel) -> wxWindow:setAcceleratorTable(This,Accel).
%% @hidden
-doc false.
scrollWindow(This,Dx,Dy, Options) -> wxWindow:scrollWindow(This,Dx,Dy, Options).
%% @hidden
-doc false.
scrollWindow(This,Dx,Dy) -> wxWindow:scrollWindow(This,Dx,Dy).
%% @hidden
-doc false.
scrollPages(This,Pages) -> wxWindow:scrollPages(This,Pages).
%% @hidden
-doc false.
scrollLines(This,Lines) -> wxWindow:scrollLines(This,Lines).
%% @hidden
-doc false.
screenToClient(This,Pt) -> wxWindow:screenToClient(This,Pt).
%% @hidden
-doc false.
screenToClient(This) -> wxWindow:screenToClient(This).
%% @hidden
-doc false.
reparent(This,NewParent) -> wxWindow:reparent(This,NewParent).
%% @hidden
-doc false.
removeChild(This,Child) -> wxWindow:removeChild(This,Child).
%% @hidden
-doc false.
releaseMouse(This) -> wxWindow:releaseMouse(This).
%% @hidden
-doc false.
refreshRect(This,Rect, Options) -> wxWindow:refreshRect(This,Rect, Options).
%% @hidden
-doc false.
refreshRect(This,Rect) -> wxWindow:refreshRect(This,Rect).
%% @hidden
-doc false.
refresh(This, Options) -> wxWindow:refresh(This, Options).
%% @hidden
-doc false.
refresh(This) -> wxWindow:refresh(This).
%% @hidden
-doc false.
raise(This) -> wxWindow:raise(This).
%% @hidden
-doc false.
popupMenu(This,Menu,X,Y) -> wxWindow:popupMenu(This,Menu,X,Y).
%% @hidden
-doc false.
popupMenu(This,Menu, Options) -> wxWindow:popupMenu(This,Menu, Options).
%% @hidden
-doc false.
popupMenu(This,Menu) -> wxWindow:popupMenu(This,Menu).
%% @hidden
-doc false.
pageUp(This) -> wxWindow:pageUp(This).
%% @hidden
-doc false.
pageDown(This) -> wxWindow:pageDown(This).
%% @hidden
-doc false.
navigate(This, Options) -> wxWindow:navigate(This, Options).
%% @hidden
-doc false.
navigate(This) -> wxWindow:navigate(This).
%% @hidden
-doc false.
moveBeforeInTabOrder(This,Win) -> wxWindow:moveBeforeInTabOrder(This,Win).
%% @hidden
-doc false.
moveAfterInTabOrder(This,Win) -> wxWindow:moveAfterInTabOrder(This,Win).
%% @hidden
-doc false.
move(This,X,Y, Options) -> wxWindow:move(This,X,Y, Options).
%% @hidden
-doc false.
move(This,X,Y) -> wxWindow:move(This,X,Y).
%% @hidden
-doc false.
move(This,Pt) -> wxWindow:move(This,Pt).
%% @hidden
-doc false.
lower(This) -> wxWindow:lower(This).
%% @hidden
-doc false.
lineUp(This) -> wxWindow:lineUp(This).
%% @hidden
-doc false.
lineDown(This) -> wxWindow:lineDown(This).
%% @hidden
-doc false.
layout(This) -> wxWindow:layout(This).
%% @hidden
-doc false.
isShownOnScreen(This) -> wxWindow:isShownOnScreen(This).
%% @hidden
-doc false.
isTopLevel(This) -> wxWindow:isTopLevel(This).
%% @hidden
-doc false.
isShown(This) -> wxWindow:isShown(This).
%% @hidden
-doc false.
isRetained(This) -> wxWindow:isRetained(This).
%% @hidden
-doc false.
isExposed(This,X,Y,W,H) -> wxWindow:isExposed(This,X,Y,W,H).
%% @hidden
-doc false.
isExposed(This,X,Y) -> wxWindow:isExposed(This,X,Y).
%% @hidden
-doc false.
isExposed(This,Pt) -> wxWindow:isExposed(This,Pt).
%% @hidden
-doc false.
isEnabled(This) -> wxWindow:isEnabled(This).
%% @hidden
-doc false.
isFrozen(This) -> wxWindow:isFrozen(This).
%% @hidden
-doc false.
invalidateBestSize(This) -> wxWindow:invalidateBestSize(This).
%% @hidden
-doc false.
initDialog(This) -> wxWindow:initDialog(This).
%% @hidden
-doc false.
inheritAttributes(This) -> wxWindow:inheritAttributes(This).
%% @hidden
-doc false.
hide(This) -> wxWindow:hide(This).
%% @hidden
-doc false.
hasTransparentBackground(This) -> wxWindow:hasTransparentBackground(This).
%% @hidden
-doc false.
hasScrollbar(This,Orient) -> wxWindow:hasScrollbar(This,Orient).
%% @hidden
-doc false.
hasCapture(This) -> wxWindow:hasCapture(This).
%% @hidden
-doc false.
getWindowVariant(This) -> wxWindow:getWindowVariant(This).
%% @hidden
-doc false.
getWindowStyleFlag(This) -> wxWindow:getWindowStyleFlag(This).
%% @hidden
-doc false.
getVirtualSize(This) -> wxWindow:getVirtualSize(This).
%% @hidden
-doc false.
getUpdateRegion(This) -> wxWindow:getUpdateRegion(This).
%% @hidden
-doc false.
getToolTip(This) -> wxWindow:getToolTip(This).
%% @hidden
-doc false.
getThemeEnabled(This) -> wxWindow:getThemeEnabled(This).
%% @hidden
-doc false.
getTextExtent(This,String, Options) -> wxWindow:getTextExtent(This,String, Options).
%% @hidden
-doc false.
getTextExtent(This,String) -> wxWindow:getTextExtent(This,String).
%% @hidden
-doc false.
getSizer(This) -> wxWindow:getSizer(This).
%% @hidden
-doc false.
getSize(This) -> wxWindow:getSize(This).
%% @hidden
-doc false.
getScrollThumb(This,Orientation) -> wxWindow:getScrollThumb(This,Orientation).
%% @hidden
-doc false.
getScrollRange(This,Orientation) -> wxWindow:getScrollRange(This,Orientation).
%% @hidden
-doc false.
getScrollPos(This,Orientation) -> wxWindow:getScrollPos(This,Orientation).
%% @hidden
-doc false.
getScreenRect(This) -> wxWindow:getScreenRect(This).
%% @hidden
-doc false.
getScreenPosition(This) -> wxWindow:getScreenPosition(This).
%% @hidden
-doc false.
getRect(This) -> wxWindow:getRect(This).
%% @hidden
-doc false.
getPosition(This) -> wxWindow:getPosition(This).
%% @hidden
-doc false.
getParent(This) -> wxWindow:getParent(This).
%% @hidden
-doc false.
getName(This) -> wxWindow:getName(This).
%% @hidden
-doc false.
getMinSize(This) -> wxWindow:getMinSize(This).
%% @hidden
-doc false.
getMaxSize(This) -> wxWindow:getMaxSize(This).
%% @hidden
-doc false.
getId(This) -> wxWindow:getId(This).
%% @hidden
-doc false.
getHelpText(This) -> wxWindow:getHelpText(This).
%% @hidden
-doc false.
getHandle(This) -> wxWindow:getHandle(This).
%% @hidden
-doc false.
getGrandParent(This) -> wxWindow:getGrandParent(This).
%% @hidden
-doc false.
getForegroundColour(This) -> wxWindow:getForegroundColour(This).
%% @hidden
-doc false.
getFont(This) -> wxWindow:getFont(This).
%% @hidden
-doc false.
getExtraStyle(This) -> wxWindow:getExtraStyle(This).
%% @hidden
-doc false.
getDPIScaleFactor(This) -> wxWindow:getDPIScaleFactor(This).
%% @hidden
-doc false.
getDropTarget(This) -> wxWindow:getDropTarget(This).
%% @hidden
-doc false.
getCursor(This) -> wxWindow:getCursor(This).
%% @hidden
-doc false.
getContainingSizer(This) -> wxWindow:getContainingSizer(This).
%% @hidden
-doc false.
getClientSize(This) -> wxWindow:getClientSize(This).
%% @hidden
-doc false.
getChildren(This) -> wxWindow:getChildren(This).
%% @hidden
-doc false.
getCharWidth(This) -> wxWindow:getCharWidth(This).
%% @hidden
-doc false.
getCharHeight(This) -> wxWindow:getCharHeight(This).
%% @hidden
-doc false.
getCaret(This) -> wxWindow:getCaret(This).
%% @hidden
-doc false.
getBestSize(This) -> wxWindow:getBestSize(This).
%% @hidden
-doc false.
getBackgroundStyle(This) -> wxWindow:getBackgroundStyle(This).
%% @hidden
-doc false.
getBackgroundColour(This) -> wxWindow:getBackgroundColour(This).
%% @hidden
-doc false.
getAcceleratorTable(This) -> wxWindow:getAcceleratorTable(This).
%% @hidden
-doc false.
freeze(This) -> wxWindow:freeze(This).
%% @hidden
-doc false.
fitInside(This) -> wxWindow:fitInside(This).
%% @hidden
-doc false.
fit(This) -> wxWindow:fit(This).
%% @hidden
-doc false.
findWindow(This,Id) -> wxWindow:findWindow(This,Id).
%% @hidden
-doc false.
enable(This, Options) -> wxWindow:enable(This, Options).
%% @hidden
-doc false.
enable(This) -> wxWindow:enable(This).
%% @hidden
-doc false.
dragAcceptFiles(This,Accept) -> wxWindow:dragAcceptFiles(This,Accept).
%% @hidden
-doc false.
disable(This) -> wxWindow:disable(This).
%% @hidden
-doc false.
destroyChildren(This) -> wxWindow:destroyChildren(This).
%% @hidden
-doc false.
convertPixelsToDialog(This,Sz) -> wxWindow:convertPixelsToDialog(This,Sz).
%% @hidden
-doc false.
convertDialogToPixels(This,Sz) -> wxWindow:convertDialogToPixels(This,Sz).
%% @hidden
-doc false.
close(This, Options) -> wxWindow:close(This, Options).
%% @hidden
-doc false.
close(This) -> wxWindow:close(This).
%% @hidden
-doc false.
clientToScreen(This,X,Y) -> wxWindow:clientToScreen(This,X,Y).
%% @hidden
-doc false.
clientToScreen(This,Pt) -> wxWindow:clientToScreen(This,Pt).
%% @hidden
-doc false.
clearBackground(This) -> wxWindow:clearBackground(This).
%% @hidden
-doc false.
centreOnParent(This, Options) -> wxWindow:centreOnParent(This, Options).
%% @hidden
-doc false.
centerOnParent(This, Options) -> wxWindow:centerOnParent(This, Options).
%% @hidden
-doc false.
centreOnParent(This) -> wxWindow:centreOnParent(This).
%% @hidden
-doc false.
centerOnParent(This) -> wxWindow:centerOnParent(This).
%% @hidden
-doc false.
centre(This, Options) -> wxWindow:centre(This, Options).
%% @hidden
-doc false.
center(This, Options) -> wxWindow:center(This, Options).
%% @hidden
-doc false.
centre(This) -> wxWindow:centre(This).
%% @hidden
-doc false.
center(This) -> wxWindow:center(This).
%% @hidden
-doc false.
captureMouse(This) -> wxWindow:captureMouse(This).
%% @hidden
-doc false.
cacheBestSize(This,Size) -> wxWindow:cacheBestSize(This,Size).
 %% From wxEvtHandler
%% @hidden
-doc false.
disconnect(This,EventType, Options) -> wxEvtHandler:disconnect(This,EventType, Options).
%% @hidden
-doc false.
disconnect(This,EventType) -> wxEvtHandler:disconnect(This,EventType).
%% @hidden
-doc false.
disconnect(This) -> wxEvtHandler:disconnect(This).
%% @hidden
-doc false.
connect(This,EventType, Options) -> wxEvtHandler:connect(This,EventType, Options).
%% @hidden
-doc false.
connect(This,EventType) -> wxEvtHandler:connect(This,EventType).
