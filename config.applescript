on standardConfig()
  set myList to {{ id: "github", _url:"https://github.com/Hireology/app", searchList: {{_url:"github.com", _title:"Hireology"}}}, ¬
                 { id: "hypem", _url: "https://hypem.com", searchList: {}} ¬
                }
  return myList
end standardConfig
