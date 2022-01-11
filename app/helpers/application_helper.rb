module ApplicationHelper
    def display_session_links
        capture do
            if user_signed_in?
                concat link_to(content_tag(:i, nil, class: 'fas fa-upload') + content_tag(:span, " Upload"), new_video_path, class: 'btn btn-success m-2')
                concat link_to(content_tag(:i, nil, class: 'fas fa-user') + content_tag(:span, " Profile"), edit_user_registration_path, class: 'btn btn-primary m-2')
                concat link_to(content_tag(:i, nil, class: 'fas fa-sign-out-alt') + content_tag(:span, " Sign out"), destroy_user_session_path, method: :delete, class: 'btn btn-danger m-2')
            else
                concat link_to(content_tag(:i, nil, class: 'fas fa-sign-in-alt') + content_tag(:span, " Sign in"), new_user_session_path, class: 'btn btn-success m-2')
                concat link_to(content_tag(:i, nil, class: 'fas fa-user-plus') + content_tag(:span, " Register"), new_user_registration_path, class: 'btn btn-primary m-2')
            end
        end
    end
end
