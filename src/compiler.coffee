CoffeeScript = require "coffee-script"
{preprocess} = require "./preprocessor"
{indent}     = require "./util"

exports.precompile = precompile = (source) ->
  script = CoffeeScript.compile preprocess(source), noWrap: true

  """
    function(__obj) {
      if (!__obj) __obj = {};
      if (window.__reactTagCount == null) window.__reactTagCount = 0;
      var __out = [], __capture = function(callback) {
        var out = __out, result;
        __out = [];
        callback.call(this);
        result = __out.join('');
        __out = out;
        return __safe(result);
      }, __sanitize = function(value) {
        if (value && value.ecoSafe) {
          return value;
        } else if (typeof value !== 'undefined' && value != null) {
          return __escape(value);
        } else {
          return '';
        }
      }, __getReactTagValue = function(tag) {
        var curr = window.__reactTagCount += 1;
        var sel = 'react-uniq-' + curr;
        setTimeout(function() {
          console.log('Append', sel, tag);
          jQuery('#' + sel).replaceWith(tag);
        }, 0);
        return '<b class="react-tmp" id="' + sel + '"></b>';
      }, __reactify = function(value, isSafe) {
        if (!(value instanceof rx.SrcCell)) {
          return isSafe ? value : __sanitize(value);
        }
        return __getReactTagValue(rx.rxt.tags.span(rx.bind(function() {
          var val = value.get();
          return isSafe ? rx.rxt.rawHtml(val) : __sanitize(val);
        })));
      }, __safe, __objSafe = __obj.safe, __escape = __obj.escape;
      __safe = __obj.safe = function(value) {
        if (value && value.ecoSafe) {
          return value;
        } else {
          if (!(typeof value !== 'undefined' && value != null)) value = '';
          var result = new String(value);
          result.ecoSafe = true;
          return result;
        }
      };
      if (!__escape) {
        __escape = __obj.escape = function(value) {
          return ('' + value)
            .replace(/&/g, '&amp;')
            .replace(/</g, '&lt;')
            .replace(/>/g, '&gt;')
            .replace(/\x22/g, '&quot;');
        };
      }
      (function() {
    #{indent script, 4}
      }).call(__obj);
      __obj.safe = __objSafe, __obj.escape = __escape;
      return __out.join('');
    }
  """

exports.compile = (source) ->
  do new Function "return #{precompile source}"
