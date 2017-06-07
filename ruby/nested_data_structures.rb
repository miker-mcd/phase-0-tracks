phone_companies = {
  apple: {
    iphone7: {
      release_date: "Sep 16, 2016",
      display: "4.7 in",
      generation: 10
      },
    c_level: ["Tim Cook", "Jon Ive", "Luca Maestri"],
    years_old: 41
    },
  samsung: {
    galaxy: {
      release_date: "Apr 21, 2017",
      display: "5.8 in",
      generation: 8
    },
    c_level: ["Lee Kun-hee", "Lee Jae-yong", "Kwon Oh-hyun"],
    years_old: 48
  }
  }

p phone_companies[:apple][:iphone7][:release_date]

p phone_companies[:apple][:c_level][0]

p phone_companies[:samsung][:c_level].push("JK Shin")

p phone_companies[:apple][:c_level].replace(phone_companies[:samsung][:c_level])

p phone_companies[:apple][:c_level][0].upcase