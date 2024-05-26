import '@ohos.utils.Rand';

export interface Question {
  word : string
  sentence: string
  options: string[]
  answer:string
}

export const QuestionData : Question[] = [
  {
    word:"Book",
    sentence:"Everyone should read book.",
    options: ["书籍","橡皮","尺子","铅笔"],
    answer:"书籍"
  },
  {
    word:"Apple",
    sentence:"I have a red apple.",
    options: ["橙子","葡萄","西瓜","苹果"],
    answer:"苹果"
  },
  {
    word:"Air",
    sentence:"human need to breath fresh air to live.",
    options: ["水","阳光","空气","森林"],
    answer:"空气"
  },
  {
    word:"Mouth",
    sentence:"Two lips make a Mouth.",
    options: ["鼻子","眼睛","耳朵","嘴巴"],
    answer:"嘴巴"
  },
  {
    word:"LOL",
    sentence:"LOL is a popular MOBA game in globe.",
    options: ["使命召唤","英雄联盟","天龙八部","老头环"],
    answer:"英雄联盟"
  },
  {
    word:"Meat",
    sentence:"Meat always have more protein than vegetables.",
    options: ["肉","西蓝花","橄榄","大白菜"],
    answer:"肉"
  },
  {
    word:"HuaWei",
    sentence:"Huawei is a technology company from China.",
    options: ["华为","苹果","谷歌","英伟达"],
    answer:"华为"
  },
  {
    word:"School",
    sentence:"Child should go to school,adult should go to work.",
    options: ["KTV","打游戏","学校","工厂"],
    answer:"学校"
  },
  {
    word:"Breakfast",
    sentence:"We eat dinner at evening and breakfast in the morning.",
    options: ["下午茶","午餐","晚餐","早餐"],
    answer:"早餐"
  },
  {
    word:"Uncle",
    sentence:"what do you call your father's younger brother?",
    options: ["爸爸","伯伯","叔叔","舅舅"],
    answer:"叔叔"
  }
]


export function getQuestions(num:number) : Question[]{
  let questions = []
  for (let i = 0; i < num; i++) {
    let r = (Math.random() * 10).toFixed()
    // console.log("r:"+r)
    questions.push(QuestionData[r])
  }
  return questions
}