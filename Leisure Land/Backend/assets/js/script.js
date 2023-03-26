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
      header: {
         'Content-Type': 'application/json'
      },
      body: JSON.stringify({
         username, email, password
      })
   }).then((res)=> res.json())

   console.log(result)


}
