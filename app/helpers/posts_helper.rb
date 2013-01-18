module PostsHelper
   def parse_photobucket_direct_link(link)
      begin
         url = link.clone
         if ! (link.match /^file=/)
            url = "file=" + link
         end
         end_of_str = url[url.index('?')..-1]
         uri_ary = end_of_str.split('&')
         /current=(?<filename>[a-z0-9_]*\.[a-z0-9]*)/i =~ uri_ary[-1]

         url = url[0..url.index('?') - 1] + filename

         logger.info "FILENAME IS #{filename}"
         logger.info "returning #{u url}"
         url
      rescue
         return "Parse_ER_Rescue"
      end
   end
end
