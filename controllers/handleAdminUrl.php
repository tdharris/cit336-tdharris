<?php
		

		function handleAdmin($url) {
			global $db;
		
			$url_clean = preg_replace('/\s*/', '', strtolower($url));

			switch ($url_clean) {
				
				case 'logout':
					session_unset();
					header("Location: /");
					break;

				case 'newAdmin':
					if($url == 'newAdmin') {
	          			include 'admin/newAdmin.php';
	        		};
	        		break;

				case 'admin':

					// Create option list of projects
					$projectsAsOptions = null;
					foreach($db->getProjectList() as $item) {
						$projectsAsOptions .= '<option>'.$item[projectName].'</option>';
					};

					$content = '<a class="pure-button" href="?action=a&url=logout" style="float:right;">Logout</a><section class="title animated fadeIn"><h1>Admin</h1>';
					$content .= '<div class="pure-g">
								    <div class="pure-u-1">
								    	<section><h2>Add Project</h2>
											<form id="addProject" name="addProject" class="pure-form pure-form-stacked">
											   <fieldset>
											      <div class="pure-control-group">
											         <label>Project Name:</label>
											         <input class="pure-u-1" type="text" name="projectName" placeholder="Name" required>
											      </div>
											      <div class="pure-control-group">
											         <label>Github URL:</label>
											         <input class="pure-u-1" type="text" name="githubURL" placeholder="URL" required>
											      </div>
											      <div class="pure-control-group">
											         <label>Category</label>
											         <select id="category" name="category" required>
									                    <option>WebDev</option>
									                    <option>Bash</option>
									                    <option>Java</option>
									                </select>
											      </div>
											      <div class="pure-control-group">
											         <label>Brief Desc:</label>
											         <input class="pure-u-1" type="text" name="brief" placeholder="Brief Description" required>
											      </div>
											      <div class="pure-control-group">
											         <label>Description:</label>
											         <textarea class="pure-u-1" name="description" placeholder="Detailed description..." rows="4" required></textarea>
											      </div>
											      <div class="pure-control-group">
											         <label>Pictures:</label>
											         <div class="dropzone" id="addPics"></div>
											      </div>
											      <div class="pure-controls">
											         <input type="submit" class="pure-button button-success" name="submit" value="Add" />
											         <input type="reset" class="pure-button" name="reset" value="Reset" /> 
											      </div>
											   </fieldset>
											</form>
										</section>
								    </div>

								    <div class="pure-u-1">
								    	<section>
								    		<h2>Delete Project</h2>
									    	<form id="deleteProject" name="deleteProject" class="pure-form pure-form-stacked">
									    		<fieldset>
											      <div class="pure-control-group">
											         <label>Project Name:</label>
											         <select class="pure-u-1" id="projectName" name="projectName" required>
											         	'.$projectsAsOptions.'
											         </select>
											      </div>
											      <div class="pure-controls">
											         <input type="submit" class="pure-button button-error" name="submit" value="Delete" />
											         <input type="reset" class="pure-button" name="reset" value="Reset" /> 
											      </div>
												</fieldset>
											</form>
								    	</section>
								    </div>

								    <div class="pure-u-1">
								    	<section><h2>Edit Project</h2>
											<form id="editProject" name="editProject" onsubmit="editProject();" class="pure-form pure-form-stacked">
											   <fieldset>
											      <div class="pure-control-group">
											         <label>Project Name:</label>
											         <select class="pure-u-1" id="category" name="category" required>
											         	'.$projectsAsOptions.'
											         </select>
											      </div>
											      <div class="pure-control-group">
											         <label>Github URL:</label>
											         <input class="pure-u-1" type="text" name="githubURL" placeholder="URL" required>
											      </div>
											      <div class="pure-control-group">
											         <label>Category</label>
											         <select id="category" name="category" required>
									                    <option>WebDev</option>
									                    <option>Bash</option>
									                    <option>Java</option>
									                </select>
											      </div>
											      <div class="pure-control-group">
											         <label>Brief Desc:</label>
											         <input class="pure-u-1" type="text" name="brief" placeholder="Brief Description" required>
											      </div>
											      <div class="pure-control-group">
											         <label>Description:</label>
											         <textarea class="pure-u-1" name="description" placeholder="Detailed description..." rows="4" required></textarea>
											      </div>
											      <div class="pure-control-group">
											         <label>Pictures:</label>
											         <div class="dropzone" id="editPics"></div>
											      </div>
											      <div class="pure-controls">
											         <input type="submit" class="pure-button pure-button-primary" name="submit" value="Save" />
											         <input type="reset" class="pure-button" name="reset" value="Reset" /> 
											      </div>
											   </fieldset>
											</form>
										</section>
									</div>

								</div>';

					break;
				}
				

				$content .= '</section>';
				return $content;

		};

?>