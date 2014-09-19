$(document).ready(function(){
	$('#new_photo').fileupload({
		dataType: 'json',
		send: function (e, data) {
			console.log(e);
			console.log(data);
      $.each(data.files, function (index, file) {
          $('<p/>').text(file.name).appendTo($('#new_photo'));
      });
    },
		fail: function (e, data) {
			console.log(e);
			console.log(data);
		},
		progressall: function (e, data) {
      var progress = parseInt(data.loaded / data.total * 100, 10);
      $('#progress .bar').css(
          'width',
          progress + '%'
      );
    }
	});
});




// $(document).ready(function(){
// 	// disable auto discover
// 	Dropzone.autoDiscover = false;
//
// 	// grap our upload form by its id
// 	$("#new_photo").dropzone({
// 		// restrict image size to a maximum 1MB
// 		maxFilesize: 10,
// 		acceptedFiles: ".jpg,.png",
// 		thumbnailWidth: 200,
// 		thumbnailHeight: 200,
// 		// changed the passed param to one accepted by
// 		// our rails app
// 		paramName: "photo[image]",
// 		// show remove links on each image upload
// 		addRemoveLinks: false,
// 		// if the upload was successful
// 		success: function(file, response){
// 			// find the remove button link of the uploaded file and give it an id
// 			// based of the fileID response from the server
// 			$(file.previewTemplate).find('.dz-remove').attr('id', response.id);
// 			// add the dz-success class (the green tick sign)
// 			$(file.previewElement).addClass("dz-success");
// 		},
// 		//when the remove button is clicked
// 		removedfile: function(file){
// 			// grap the id of the uploaded file we set earlier
// 			var id = $(file.previewTemplate).find('.dz-remove').attr('id');
//
// 			// make a DELETE ajax request to delete the file
// 			$.ajax({
// 				type: 'DELETE',
// 				url: '/backend/photos/' + id,
// 				success: function(data){
// 					console.log(data.message);
// 				}
// 			});
// 		}
// 	});
// });
