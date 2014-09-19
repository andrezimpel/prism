$(document).ready(function(){
	$('#new_photo').fileupload({
		dataType: "script",
		add: function(e, data){
			types = /(\.|\/)(gif|jpe?g|png)$/i;
			file = data.files[0];
			timestamp = Date.now();
			if (types.test(file.type) || types.test(file.name)) {
				data.context = $(tmpl("template-upload", file, timestamp));
				$('#photo-row').before(data.context);
				data.timestamp = timestamp;
				data.submit();
			} else {
				alert("#{file.name} is not a gif, jpeg, or png image file");
			}
		},
		progress: function(e, data) {
			if (data.context) {
					progress = parseInt(data.loaded / data.total * 100, 10);
					data.context.find('.progress-bar').css('width', progress + '%');
			}
		},
		done: function (e, data) {
			timestamp = data.timestamp;
			$elem = $("[data-timestamp='" + timestamp + "']");

			$elem.addClass('animated fadeOutDown');
			$elem.one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
				$this = $(this);
				$this.animate({
          height: "0px"
        }, 700, function(){
					console.log("done");
					$this.remove();
				});
			});
		}
	});
});
