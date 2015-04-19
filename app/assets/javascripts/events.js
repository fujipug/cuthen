var ready = function() {
    user_field_count = $('.hidden_user_input').length;
};
$(document).ready(ready);
$(document).on('page:load', ready);

function remove_field(btn, input, display) {
    $("input[name='"+ input + "']").attr({"value" : "", "type" : "hidden"});
    $("#" + btn).remove()
    $("#" + display).remove()
}

function add_user_field(btn, model, type, user_id, user_name, user_title, user_email, user_upadted_at) {
    model = "user";
    remove_button=$('<button id="remove_field_button_' + user_id + '" name="button" onclick="remove_field(\'remove_field_button_' + user_id + '\', \''+ type + '['+ type + '_invited_' + model + 's_attributes][' + user_id + '][' + model + '_id]\', \'' + model + '_invited_users_display_' + user_id + '\')">Remove</button>');
    label=$('<label class="sr-only" for="'+ type + '_invited_users_attributes_' + (user_id + user_field_count) + '_user_id">User ID</label>');
    input=$('<input class="hidden_user_input" id="'+ type + '_'+ type + '_invited_' + model + 's_attributes_' + (user_id + user_field_count)  + '_' + model + '_id" name="'+ type + '['+ type + '_invited_' + model + 's_attributes][' + (user_id + user_field_count) + '][' + model + '_id]" type="number" value=' + user_id + '>');
    display=$('<div id="' + model + '_invited_users_display_' + (user_id + user_field_count)  + '"><div class="image-block"><img alt="User image" height="32" src="/assets/user_image.png" width="32"></div><div class="col-xs-3">' + user_name + '</div><div class="col-xs-3">' + user_title + '</div><div class="col-xs-3">' + user_email + '</div></div></div>');
    nested_form_div=$('<div class="form-group"></div>');
    
    nested_form_div.append(remove_button, label, input, display);
    $('#'+ type + '_invited_' + model + 's_form').append(nested_form_div);
    $('#' + btn).attr("onclick","add_" + model + "_field('add_" + model + "_button', '" + model + "', '"+ type + "')");
}/*
    <%= content_tag :div, class: "row", id: "itinerary_invited_users_display_" + i.to_s do -%>
        <div class="image-block">
            <img alt="User image" height="32" src="/assets/user_image.png" width="32">
        </div>
        <div class="col-xs-3"><%= @users[i].name %></div>
        <div class="col-xs-3"><%= @users[i].title %></div>
        <div class="col-xs-3"><%= @users[i].email %></div>
        <div class="col-xs-2">
            <%= button_tag "Remove", type: "button", id: "remove_field_button_" + i.to_s, onclick: "remove_field('remove_field_button_" + i.to_s + "', 'itinerary[itinerary_invited_users_attributes][" + i.to_s + "][user_id]', 'itinerary_invited_users_display_" + i.to_s + "')" %>
        </div>
    <% end -%>*/