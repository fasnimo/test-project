class Forum < ActiveRecord::Base
    belongs_to :gamer
    validates :title, :body, presence: true
    validates :title, length: { minimum: 4 }

    # <% flash.keys.each do |type| %>
    #     <div data-alert class="flash <%= type %> alert-box radius">
    #       <%= flash[type] %>
    #       <a href="#" class="close">&times;</a>
    #     </div>
    # <% end %>

end