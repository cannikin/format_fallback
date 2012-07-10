require "format_fallback/version"

module ActionView
  class PathSet < Array

    def find_with_default_template(path, prefix = nil, partial = false, details = {}, key = nil)
      if prefix == "layouts"
        # Layouts have their own way of managing fallback, better leave them alone
        find_without_default_template(path, prefix, partial, details, key)
      else
        begin
          find_without_default_template(path, prefix, partial, details, key)
        rescue MissingTemplate => e
          raise e if details[:formats] == [:html]
          html_details = details.dup.merge(:formats => [:html])
          find_without_default_template(path, prefix, partial, html_details, key)
        end
      end
    end
    alias_method_chain :find, :default_template

  end
  
  class Resolver
    
    def cached(key, prefix, name, partial)
      return yield unless key && caching?
      cache_content = yield
      if cache_content.empty?
        []
      else
        @cached[key][prefix][name][partial] ||= cache_content
      end
    end
    
  end
end
