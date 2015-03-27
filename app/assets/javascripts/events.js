function remove_field(btn, input) {
    $("input[name='"+ input + "']").attr({"value" : "", "type" : "hidden"});
    $("#" + btn).remove()
}

function add_user_field(btn, model, nested_id, type) {
  remove_button=$('<button id="remove_field_button_' + nested_id + '" name="button" onclick="remove_field(\'remove_field_button_"' + nested_id + '"\', \''+ type + '['+ type + '_invited_' + model + 's_attributes]["' + nested_id + '"][' + model + '_id]\')">Remove</button>');
  label=$('<label class="sr-only" for="'+ type + '_invited_users_attributes_' + nested_id + '_user_id">User ID</label>');
  input=$('<input class="form-control input-lg" id="'+ type + '_'+ type + '_invited_' + model + 's_attributes_' + nested_id + '_' + model + '_id" name="'+ type + '['+ type + '_invited_' + model + 's_attributes][' + nested_id + '][' + model + '_id]" type="number">');
  nested_form_div=$('<div class="form-group"></div>');
  
  nested_form_div.append(remove_button, label, input);
  $('#'+ type + '_invited_' + model + 's_form').append(nested_form_div);
  $('#' + btn).attr("onclick","add_" + model + "_field('add_" + model + "_button', '" + model + "', " + (nested_id + 1) + ", '"+ type + "')");
}