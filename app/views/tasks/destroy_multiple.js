<% publish_to "/#{@company.name}/categories/tasks/destroy_multiple" do %>
	$('#content_body').html('<%= escape_javascript render :partial => "categories/category_cell", :locales => {:@company => @company} %>');
<% end %>