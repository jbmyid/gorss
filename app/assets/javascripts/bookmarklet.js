url = window.document.documentURI;
title = window.document.title;
window.open("http://localhost:3000/user/tabs/new?title="+encodeURIComponent(title)+"&url="+encodeURIComponent(url),"Import Tab", "resizable=1,width=350,height=250");
// alert("hello")