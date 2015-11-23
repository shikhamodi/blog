module ApplicationHelper
	 def tinymce_assets
	      javascript_include_tag "tinymce"
	 end

	def embed(youtube_url)
		#youtube_url = "http://www.youtube.com/watch?v=DokUjuZmpCE";
		if youtube_url.include? '='
			youtube_id = youtube_url.split("=").last
		else
  	  youtube_id = youtube_url.split("/").last
  	end
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
  end
end


