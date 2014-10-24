// Handlebars Delimiter
Handlebars.setDelimiter = function(start,end){
    //save a reference to the original compile function
    if(!Handlebars.original_compile)
        Handlebars.original_compile = Handlebars.compile;

    Handlebars.compile = function(source){
        var s = "\\"+start,
            e = "\\"+end,
            RE = new RegExp('('+s+'{2,3})(.*?)('+e+'{2,3})','ig');

        replacedSource = source.replace(RE,function(match, startTags, text, endTags, offset, string){
            var startRE = new RegExp(s,'ig'), endRE = new RegExp(e,'ig');

            startTags = startTags.replace(startRE,'\{');
            endTags = endTags.replace(endRE,'\}');

            return startTags+text+endTags;
        });

        return Handlebars.original_compile(replacedSource);
    };
};
