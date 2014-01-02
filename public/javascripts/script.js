$(function(){
});

function to_text_field(ele){
	id = ele.id;
	val = ele.innerHTML;
	<
	$(id).html(" j <%= form_for(:tasks, :url => {:action => 'update', :controller => 'tasks'}, :method => true) do |f| %>
		<%= f.text_field(:name) %>");
	
}
