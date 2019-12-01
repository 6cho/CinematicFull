function createHeader(title,err,msg,background){
	let h = document.createElement("h1");
	h.innerHTML=title;

	let errh = document.createElement("h3");
	errh.innerHTML=err;
	errh.className="text-red";
	
	let msgh= document.createElement("h3");
	msgh.innerHTML=msg;
	
	let header=document.getElementById("header");
	header.style="background-image: url('"+background+"');"
	
	header.appendChild(h);
	header.appendChild(errh);
	header.appendChild(msgh);
}





function createFooter(){   
    let p = document.createElement("p");
    p.innerHTML=
    	"Authors: Eric Cho and Overton Wright<br>"+
		"Course: CSCI 4300<br>"+
		"Term: Fall 2019<br>"+
		"Professor: Dr. Ahmadzadeh";
    document.getElementById("footer").appendChild(p);
}





function createNav(isSess){   
	
	let nav=document.getElementById("nav");
	
	let title = document.createElement("a");
	title.id="titlebtn";
	title.href="IndexServlet";
	title.innerHTML="CINEMATIC";
	
	let profile = document.createElement("a");
	profile.className="text-nav";
	profile.href="profile.jsp";
	profile.innerHTML="PROFILE";
	
	let logout = document.createElement("a");
	logout.className="text-nav";
	logout.href="LogoutServlet";
	logout.innerHTML="LOGOUT";
	
	let login = document.createElement("a");
	login.className="text-nav";
	login.href="login.jsp";
	login.innerHTML="LOGIN";

	let register = document.createElement("a");
	register.className="text-nav";
	register.href="register.jsp";
	register.innerHTML="REGISTER";
	
	let search = document.createElement("form"); //unsure
	search.id="search";
	search.name="search";
	search.action="SearchServlet";
	search.method="post";
	search.className="float-r";

	let searchText = document.createElement("input");//unsure
	searchText.type="text";
	searchText.id="searchquery";
	searchText.name="searchquery";
	searchText.className="text-nav border";
	searchText.style="width:15vw;";
	
	let searchSubmit = document.createElement("input");//unsure
	searchSubmit.type="submit";
	searchSubmit.id="search-submit";
	searchSubmit.className="text-nav";
	searchSubmit.value="SEARCH";
	
	nav.appendChild(title);
	nav.appendChild(search);
	if (isSess){
		search.appendChild(profile);
		search.appendChild(logout);
	} else {
		search.appendChild(register);
		search.appendChild(login);
	}
	search.appendChild(searchText);
	search.appendChild(searchSubmit);
}





function validateLogin(){
	
    let e=document.getElementById("email-current").value;
    let p=document.getElementById("pass-current").value;
    let l1=document.getElementById("label1");
    let l2=document.getElementById("label2");
    
    l1.innerHTML=e ? "" : "Email cannot be left empty";
    l2.innerHTML=p ? "" : "Password cannot be left empty";
    
    if(e&&p)return true;
    return false;
}





function validateEditProfile(){
	
    let e=document.getElementById("email").value;
    let p=document.getElementById("pass").value;
    let f=document.getElementById("fname").value;
    let l=document.getElementById("lname").value;
    let a=document.getElementById("address").value;
    let c=document.getElementById("city").value;
    let s=document.getElementById("state").value;
    let z=document.getElementById("zip").value;
    let ec=document.getElementById("email-current").value;
    let pc=document.getElementById("pass-current").value;
   
    let l1=document.getElementById("label1");
    let l2=document.getElementById("label2");
    let l3=document.getElementById("label3");
    let l4=document.getElementById("label4");
    let l5=document.getElementById("label5");
    let l6=document.getElementById("label6");
    let l7=document.getElementById("label7");
    let l8=document.getElementById("label8");
    let l9=document.getElementById("label9");
    let l10=document.getElementById("label10");
    
    l1.innerHTML=e ? "" : "Email cannot be left empty";
    l2.innerHTML=p ? "" : "Password cannot be left empty";
    l3.innerHTML=f ? "" : "First name cannot be left empty";
    l4.innerHTML=l ? "" : "Last name cannot be left empty";
    l5.innerHTML=a ? "" : "Address cannot be left empty";
    l6.innerHTML=c ? "" : "City cannot be left empty";
    l7.innerHTML=s ? "" : "State cannot be left empty";
    l8.innerHTML=z ? "" : "Zip cannot be left empty";
    l9.innerHTML=ec ? "" : "Current email cannot be left empty";
    l10.innerHTML=pc ? "" : "Current password cannot be left empty";
    
    if(e&&p&&f&&l&&a&&c&&s&&z&&ec&&pc)return true;
    return false;
}





function validateRegister(){
    let e=document.getElementById("email").value;
    let ec=document.getElementById("email-confirm").value;
    let p=document.getElementById("pass").value;
    let pc=document.getElementById("pass-confirm").value;
    let f=document.getElementById("fname").value;
    let l=document.getElementById("lname").value;
    
    let l1=document.getElementById("label1");
    let l2=document.getElementById("label2");
    let l3=document.getElementById("label3");
    let l4=document.getElementById("label4");
    let l5=document.getElementById("label5");
    let l6=document.getElementById("label6");
    
    l1.innerHTML=e  ? "" : "Email cannot be left empty";
    l2.innerHTML=ec ? "" : "Email cannot be left empty";
    l3.innerHTML=p  ? "" : "Password cannot be left empty";
    l4.innerHTML=pc ? "" : "Password cannot be left empty";
    l5.innerHTML=e  ? "" : "First name cannot be left empty";
    l6.innerHTML=p  ? "" : "Last name cannot be left empty";
    
    if (e||ec){
        l1.innerHTML= e==ec ? "" : "Emails must match";
        l2.innerHTML= e==ec ? "" : "Emails must match";
    }
    
    if (p||pc){
        l3.innerHTML= p==pc ? "" : "Passwords must match";
        l4.innerHTML= p==pc ? "" : "Passwords must match";
    }
    
    if (f&&l&&e&&ec&&p&&pc&&p==pc&&e==ec)return true;
    return false;    
}
