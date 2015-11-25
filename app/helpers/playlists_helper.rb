module PlaylistsHelper
	def embed(link)
		#youtube_url = "http://www.youtube.com/watch?v=DokUjuZmpCE";
		if link.include? '='
			youtube_id = link.split("=").last
		else
  	  youtube_id = link.split("/").last
  	end
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
  end
end
