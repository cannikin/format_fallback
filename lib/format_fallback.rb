require "format_fallback/version"

module ActionView
  class PathSet < Array

    def find_with_default_template(path, prefix = nil, partial = false, details = {}, key = nil)
      begin
        find_without_default_template(path, prefix, partial, details, key)
      rescue MissingTemplate => e
        raise e if details[:formats] == [:html]
        html_details = details.dup.merge(:formats => [:html])
        find_without_default_template(path, prefix, partial, html_details, key)
        #template = find_all(path, prefix, partial, html_details, key).first
        #raise MissingTemplate.new(self, "#{prefix}/#{path}", details, partial) unless template
      end
      #template
    end
    alias_method_chain :find, :default_template

  end
end
