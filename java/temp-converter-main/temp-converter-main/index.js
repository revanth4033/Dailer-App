let cellInput= document.querySelector('#cell>input')
let ferInput= document.querySelector('#fahrenheit>input')
let kelInput= document.querySelector('#kelvin>input')

let btn=document.querySelector('.button button')

function roundNumber(number){
    return Math.round(number*100)/100
}

cellInput.addEventListener('input',function(){
    let cTemp=parseFloat(cellInput.value)
    let fTemp=(cTemp*(9/5))+32
    let kTemp=cTemp+273.15


    ferInput.value=roundNumber(fTemp)

    kelInput.value=roundNumber(kTemp)
})

ferInput.addEventListener('input',function(){
    let fTemp=parseFloat(ferInput.value)
    let cTemp=(fTemp-32)*(5/9)
    let kTemp=(fTemp-32)*(5/9)+273.15


    cellInput.value=roundNumber(cTemp)

    kelInput.value=roundNumber(kTemp)
})

kelInput.addEventListener('input',function(){
    let kTemp=parseFloat(kelInput.value)
    let cTemp=kTemp-273.15
    let fTemp=(kTemp-273.15)*(9/5)+32


    cellInput.value=roundNumber(cTemp)

    ferInput.value=roundNumber(fTemp)
})


btn.addEventListener('click',()=>{
    cellInput.value=""
    ferInput.value=""
    kelInput.value=""
})