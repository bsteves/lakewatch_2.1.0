xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Sampling Events"
    xml.link formatted_samplings_url(:rss)
    xml.description "List of Recent Sampling Events"
    xml.language "en-us" 
    for sampling in @allsamplings
      xml.item do
        xml.title sampling.id
        xml.description sampling.user.username + ": " + sampling.site.lake.name + ": " +  sampling.site.name
        xml.pubDate sampling.created_at.to_s(:rfc822)
        xml.link sampling_url(sampling)
        xml.guid sampling_url(sampling)
      end
    end
  end
end
