require "format_fallback/version"

module ActionView
  class PathSet < Array

    def find(path, prefix = nil, partial = false, details = {}, key = nil)
      begin
        template = find_all(path, prefix, partial, details, key).first
        raise MissingTemplate.new(self, "#{prefix}/#{path}", details, partial) unless template
      rescue MissingTemplate => e
        raise e if details[:formats] == [:html]
        html_details = details.dup.merge(:formats => [:html])
        template = find_all(path, prefix, partial, html_details, key).first
        raise MissingTemplate.new(self, "#{prefix}/#{path}", details, partial) unless template
      end
      template
    end

  end
end
