module VideosHelper
    def display_show_video_links(video)
        capture do
            concat link_to 'Back', videos_path, class: 'btn btn-primary'
            if current_user == video.user
                concat link_to 'Edit', edit_video_path(@video), class: 'btn btn-info ml-2'
                concat link_to 'Remove', video, method: :delete, data: { confirm: 'Are you sure?' }, class: 'btn btn-danger ml-2'
            end
        end
    end
end
