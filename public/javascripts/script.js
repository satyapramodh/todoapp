$(function() {

    $( ".category_cell" ).sortable({
      revert: true
    });
    $( ".draggable" ).draggable({
      connectToSortable: ".category_cell",
      helper: "clone",
      revert: "invalid"
    });
    $( ".sortable" ).sortable({
      revert: true
    });
    $( ".draggable" ).draggable({
      connectToSortable: ".sortable",
      helper: "clone",
      revert: "invalid"
    });
    $( "ul, li" ).disableSelection();


		$('.checkable').on('click',function() {
				//alert("workin");
    		$(this).closest('form').submit();
		});

		$('.blurred').on('blur',function() {
    		$(this).closest('form').submit();
		});

});

function convert_to_field(ele,val){
	alert(ele.id);
	$(ele).hide().after('<%= render :partial => "categories/edit_task", :locales => {:task_id => val} %>');
}



// function to_text_field(ele){
// 	id = ele.id;
// 	val = ele.innerHTML;
// 	$(id).html(" j <%= form_for(:tasks, :url => {:action => 'update', :controller => 'tasks'}, :method => true) do |f| %>
// 		<%= f.text_field(:name) %>");	
// }





