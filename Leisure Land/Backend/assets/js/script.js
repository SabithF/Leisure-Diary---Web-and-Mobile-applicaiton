

const registerButton = document.getElementById("register");
const loginButton = document.getElementById("login");
const container = document.getElementById("container");

registerButton.addEventListener("click", ()=> {
   container.classList.add("right-panel-active");
});

loginButton.addEventListener("click", ()=> {
   container.classList.remove("right-panel-active");
});


const form = document.getElementById('reg-form');
form.addEventListener('submit', registerUser);

async function registerUser(event){
   event.preventDefault()
   const username = document.getElementById('username').value
   const email = document.getElementById('userEmail').value
   const password = document.getElementById('password').value

   const result = await fetch('/api/register', {
      method: 'POST',
      headers: {
         'Content-Type': 'application/json'
      },
      body: JSON.stringify({
         username, email, password
      })
   }).then((res)=> res.json())

   if(result.status == 'ok'){
      alert('User created sucessfully');
      window.location.href='http://localhost:5000'
      
  }else{
      alert(result.error)
  }
 


}

// Login
const loginform = document.getElementById('login-form');
loginform.addEventListener('submit', loginForm);

async function loginForm(event){
   event.preventDefault()
   const username = document.getElementById('username-login').value
   const password = document.getElementById('password-login').value

   const loginresult = await fetch('/api/login', {
      method: 'POST',
      headers: {
         'Content-Type': 'application/json'
      },
      body: JSON.stringify({
         username, password,
         
      })
   }).then((res)=> res.json())

   if(loginresult.status == 'ok'){
      window.location.href='http://localhost:5000/api/dashboard'
      console.log('Got the token:', loginresult.data)
      localStorage.setItem('token', loginresult.data )
      // alert('Success')
      
  }else{
      alert(loginresult.error)
  }
 


}



