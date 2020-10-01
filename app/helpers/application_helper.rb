module ApplicationHelper
    def full_title(page_title)
        base_title = "EdgeWorks Software Ltd"
        if page_title.empty?
            base_title
        else
            "EW | #{page_title}"
        end
    end
end
