xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Users"
    xml.link formatted_users_url(:rss)
    xml.description "List of Users"
    xml.language "en-us" 
    for user in @users
      xml.item do
        xml.title user.email
        xml.description user.username
        xml.pubDate user.created_at.to_s(:rfc822)
        xml.link user_url(user)
        xml.guid user_url(user)
      end
    end
  end
end
