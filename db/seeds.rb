artists = []
100.times do |i|
  artists << Artist.create({
    name: "SomeDude #{i}"
  })
end

songs = []
100.times do |i|
  songs << Song.create({
    title: "New Song #{i}",
    released_on: i.days.ago,
    genre: "X #{i}",
    rating: rand(i),
    artist_id: artists.sample.id
  })
end

billboards = []
10.times do |i|
  billboards << Billboard.create({
    title: "Top #{i} songs",
    country: ["US", "CA", "DE"].sample
  })
end

10.times do
  song = songs.sample
  song.billboards << billboards.sample
end

