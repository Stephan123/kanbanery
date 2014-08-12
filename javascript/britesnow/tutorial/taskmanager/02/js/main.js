// Here we are telling brite to load the /tmpl/ViewName.tmpl and /css/ViewName.css
// on demand. Very useful for development, could be turn off for production (where files could 
// be pre-compile and concatenated).
brite.viewDefaultConfig.loadTmpl = true;
brite.viewDefaultConfig.loadCss = true;

// When the document is ready, we display the MainView (which will display the sub views) 
$(document).ready(function(){
  brite.display("MainView","#pageBody");
});

// Just a little indirection to render a template using handlebars.
// This simple indirection allows much flexibility later one, 
// when using pre-compiling or other templating engine are needed.
Handlebars.templates = Handlebars.templates || {};	
function render(templateName,data){
	var tmpl = Handlebars.templates[templateName];
	
	if (!tmpl){
		var tmplContent = $("#" + templateName).html();
		tmpl = Handlebars.compile(tmplContent);
		Handlebars.templates[templateName] = tmpl;		
	}
	return tmpl(data);
}


var main = main || {};
// Best-Practice: always scope your code in function (here we use immediate javascript function)
(function(){
	
	main.projectListTestData = [
		{id:"001",title:"Grocery List"},
		{id:"002",title:"House Remodeling"},
		{id:"003",title:"Learn HTML5"},
		{id:"004",title:"Learn Brite"}
	]
	
	main.taskListTestData = [
		{id:"101",projectId:"001",done:false,title:"Heavy Whipping cream"},
		{id:"102",projectId:"001",done:true,title:"1 Garlic"},
		{id:"103",projectId:"001",done:false,title:"Mushrooms (cèpe)"},
		{id:"104",projectId:"001",done:false,title:"Fresh Pasta"}
  ]
})();