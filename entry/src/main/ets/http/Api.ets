import { instance } from './Network'
import router from '@ohos.router'

export function login(phone:string,code:string) {
  instance.post('',{
    phone: phone,
    code: code
  }).then((data)=> {
    // router.back()
  }).catch((error)=> {

  })
}