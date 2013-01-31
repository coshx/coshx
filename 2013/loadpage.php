<?php 
	
	if( isset($_POST) && isset($_POST['url'])){		
		$file = file_get_contents(sprintf('pages/%s.htm', $_POST['url']) , true);
		echo $file;		
	}
?>