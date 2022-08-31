//client side validation
const form= document.querySelector('.form')
const username = document.querySelector("#username");
const email = document.querySelector("#email");
const password = document.querySelector("#password");
const password2 = document.querySelector("#password2");



const setError=(element, msg, index2)=>{
    const formControl = element.parentElement;
    const small = document.querySelectorAll(".small");
    small.forEach((e, index) => {
        if (index === index2) {
        e.classList.add('error')
        e.innerText = msg;
    }
    })
    formControl.classList.add('error')
    formControl.classList.remove('success')
}

const setSuccess=(element, msg)=>{
    const formControl = element.parentElement;
    const small = document.querySelector(".small");
    small.innerText = '';

    formControl.classList.add('success')
    formControl.classList.remove('error')
}

const isValidEmail = email => {
    const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(String(email).toLowerCase());
}

const ValidateInputs=()=>{
    const usernameValue = username.value.trim();
    console.log(usernameValue);
    const emailValue = email.value.trim();
    console.log(emailValue);
    const passwordValue = password.value.trim();
    console.log(passwordValue);
    const passwordValue2 = password2.value.trim();


    if(usernameValue ===''){
       setError(username, 'username is required', 0);
    }else{
        setSuccess(username)
    }

    if(emailValue===''){
        setError(email, 'email is required', 1)
    }else if(!isValidEmail(emailValue)){
        setError(email, 'provide a valid email value', 1)
    }else{
        setSuccess(email)
    }

    if(passwordValue===''){
        setError(password, 'password is required', 2)
    }else if(passwordValue.length<8){
        setError(password, 'Password must be at least 8 character', 2)
    }else{
        setSuccess(password)
    }

    if(passwordValue2===''){
        setError(password2, 'Please confirm your password', 3)
    }else if(passwordValue !== passwordValue2){
        setError(password2, 'Passwords doesn\'t match', 3)
    }else{
        setSuccess(password2)
    }
}
//end client side validation

const sinUpBtn = document.querySelector('.signup-button');


sinUpBtn.addEventListener('click', (e) => {

     const username = document.querySelector("#username").value;
     const email = document.querySelector("#email").value;
     const password = document.querySelector("#password").value;
     const confirmPassword = document.querySelector("#password2").value;
     

    e.preventDefault();
    
    ValidateInputs()
    fetch('/signup', 
    {
        method: 'POST',
         headers: {
        'Content-Type': 'application/json'
        },

        body: JSON.stringify({
        username, email, password, confirmPassword
       })
})
// .then(window.location.href = '/html/signin.html')

})