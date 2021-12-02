module ApplicationHelper
    def display_session_links
        capture do
            if user_signed_in?
                concat link_to "Edit profile", edit_user_registration_path, class: 'btn btn-primary m-2 fs-3'
                concat " "
                concat link_to "Sign out", destroy_user_session_path, method: :delete, class: 'btn btn-danger m-2 fs-3'
            else
                concat link_to "Sign in", new_user_session_path, class: 'btn btn-primary m-2'
                concat " "
                concat link_to "Register", new_user_registration_path, class: 'btn btn-info m-2'
                concat " "
            end
        end
    end
end
