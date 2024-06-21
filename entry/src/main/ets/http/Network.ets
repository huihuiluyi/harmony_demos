import '@ohos/axios'
import { Axios } from '@ohos/axios'

export const instance = new Axios({
  baseURL: '',
  timeout: 3000
})