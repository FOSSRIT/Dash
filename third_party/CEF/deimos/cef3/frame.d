module deimos.cef3.rame;

// Copyright (c) 2012 Marshall A. Greenblatt. All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are
// met:
//
//    * Redistributions of source code must retain the above copyright
// notice, this list of conditions and the following disclaimer.
//    * Redistributions in binary form must reproduce the above
// copyright notice, this list of conditions and the following disclaimer
// in the documentation and/or other materials provided with the
// distribution.
//    * Neither the name of Google Inc. nor the name Chromium Embedded
// Framework nor the names of its contributors may be used to endorse
// or promote products derived from this software without specific prior
// written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
// ---------------------------------------------------------------------------
//
// This file was generated by the CEF translator tool and should not edited
// by hand. See the translator.README.txt file in the tools directory for
// more information.
//

extern(C) {

import deimos.cef3.base;
import deimos.cef3.browser;
import deimos.cef3.dom;
import deimos.cef3.request;
import deimos.cef3.stream;
import deimos.cef3.string_visitor;
import deimos.cef3.v8;


///
// Structure used to represent a frame in the browser window. When used in the
// browser process the functions of this structure may be called on any thread
// unless otherwise indicated in the comments. When used in the render process
// the functions of this structure may only be called on the main thread.
///
struct cef_frame_t {
    ///
    // Base structure.
    ///
    cef_base_t base;

    ///
    // True if this object is currently attached to a valid frame.
    ///
    extern(System) int function(cef_frame_t* self) is_valid;

    ///
    // Execute undo in this frame.
    ///
    extern(System) void function(cef_frame_t* self) undo;

    ///
    // Execute redo in this frame.
    ///
    extern(System) void function(cef_frame_t* self) redo;

    ///
    // Execute cut in this frame.
    ///
    extern(System) void function(cef_frame_t* self) cut;

    ///
    // Execute copy in this frame.
    ///
    extern(System) void function(cef_frame_t* self) copy;

    ///
    // Execute paste in this frame.
    ///
    extern(System) void function(cef_frame_t* self) paste;

    ///
    // Execute delete in this frame.
    ///
    extern(System) void function(cef_frame_t* self) del;

    ///
    // Execute select all in this frame.
    ///
    extern(System) void function(cef_frame_t* self) select_all;

    ///
    // Save this frame's HTML source to a temporary file and open it in the
    // default text viewing application. This function can only be called from the
    // browser process.
    ///
    extern(System) void function(cef_frame_t* self) view_source;

    ///
    // Retrieve this frame's HTML source as a string sent to the specified
    // visitor.
    ///
    extern(System) void function(cef_frame_t* self, cef_string_visitor_t* visitor) get_source;

    ///
    // Retrieve this frame's display text as a string sent to the specified
    // visitor.
    ///
    extern(System) void function(cef_frame_t* self, cef_string_visitor_t* visitor) get_text;

    ///
    // Load the request represented by the |request| object.
    ///
    extern(System) void function(cef_frame_t* self, cef_request_t* request) load_request;

    ///
    // Load the specified |url|.
    ///
    extern(System) void function(cef_frame_t* self, const(cef_string_t)* url) load_url;

    ///
    // Load the contents of |string_val| with the specified dummy |url|. |url|
    // should have a standard scheme (for example, http scheme) or behaviors like
    // link clicks and web security restrictions may not behave as expected.
    ///
    extern(System) void function(cef_frame_t* self, const(cef_string_t)* string_val,
                        const(cef_string_t)* url) load_string;

    ///
    // Execute a string of JavaScript code in this frame. The |script_url|
    // parameter is the URL where the script in question can be found, if any. The
    // renderer may request this URL to show the developer the source of the
    // error.  The |start_line| parameter is the base line number to use for error
    // reporting.
    ///
    extern(System) void function(cef_frame_t* self, const(cef_string_t)* code,
                        const(cef_string_t)* script_url, int start_line) execute_java_script;

    ///
    // Returns true (1) if this is the main (top-level) frame.
    ///
    extern(System) int function(cef_frame_t* self) is_main;

    ///
    // Returns true (1) if this is the focused frame.
    ///
    extern(System) int function(cef_frame_t* self) is_focused;

    ///
    // Returns the name for this frame. If the frame has an assigned name (for
    // example, set via the iframe "name" attribute) then that value will be
    // returned. Otherwise a unique name will be constructed based on the frame
    // parent hierarchy. The main (top-level) frame will always have an NULL name
    // value.
    ///
    // The resulting string must be freed by calling cef_string_userfree_free().
    extern(System) cef_string_userfree_t function(cef_frame_t* self) get_name;

    ///
    // Returns the globally unique identifier for this frame.
    ///
    extern(System) int64 function(cef_frame_t* self) get_identifier;

    ///
    // Returns the parent of this frame or NULL if this is the main (top-level)
    // frame.
    ///
    extern(System) cef_frame_t* function(cef_frame_t* self) get_parent;

    ///
    // Returns the URL currently loaded in this frame.
    ///
    // The resulting string must be freed by calling cef_string_userfree_free().
    extern(System) cef_string_userfree_t function(cef_frame_t* self) get_url;

    ///
    // Returns the browser that this frame belongs to.
    ///
    extern(System) cef_browser_t* function(cef_frame_t* self) get_browser;

    ///
    // Get the V8 context associated with the frame. This function can only be
    // called from the render process.
    ///
    extern(System) cef_v8context_t* function(cef_frame_t* self) get_v8context;

    ///
    // Visit the DOM document. This function can only be called from the render
    // process.
    ///
    extern(System) void function(cef_frame_t* self, cef_domvisitor_t* visitor) visit_dom;
}


}