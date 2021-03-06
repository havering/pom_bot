class PomFacts

  POM_FACTS = [
    'Queen Victoria owned a particularly small Pomeranian and consequently the smaller variety became universally popular.',
    'Classed as a toy dog breed bc of its small size, the Pomeranian is descended from the larger Spitz type dogs, specifically the German Spitz',
    'Pomeranians are small dogs weighing 1.9–3.5 kilograms and standing 5.0–11 inches high at the withers.',
    'Pomeranians are compact but sturdy dogs with an abundant textured coat with a highly plumed tail set high and flat.',
    'The top coat forms a ruff of fur on the neck, which Poms are well known for, & they also have a fringe of feathery hair on the hindquarters',
    'Pomeranians are typically friendly, playful and lively but can be aggressive to other dogs and try to prove themselves.',
    'Pomeranians are alert & aware of changes in their environment, & barking at new stimuli can develop into a habit of barking excessively.',
    'Pomeranians are somewhat defensive of their territory and thus may bark when they encounter outside noises.',
    'Pomeranians are intelligent dogs, respond well to training, and can be very successful in getting what they want from their owners.',
    'Pomeranians are extroverted and enjoy being the center of attention but can become dominant if not well trained and socialized.',
    'The use of toys can be an effective tool in training Pomeranians to spend time alone.',
    'Have ethical problems with fur, but love the look? Bring along a Pomeranian friend to make your outfit more fabulous!',
    'Pomeranians are the smartest dog, much smarter than pretty much all cats.',
    'The Pomeranian is a small but energetic breed of dog.',
    'The forerunners of today\'s Pomeranian breed were large working dogs from the Arctic regions.',
    'In 1767, Queen Charlotte, Queen-consort of King George III of England, brought two Pomeranians to England.',
    'The offspring of a Pomeranian & a wolf bred by an animal merchant from London is discussed in Thomas Pennant\'s A Tour in Scotland from 1769',
    'Pomeranians boast one of the widest variety of color options in one breed.',
    'Cats are all right, but a Pomeranian is the better accessory for the Fall.',
    'Legend has is that while Michelangelo painted the Sistine Chapel, his Pomeranian sat relaxing on a silk pillow, watching the master at work',
    'Pomeranian was one of the two dogs rescued from the Titanic.',
    'If someone comes into your home, let alone just passes by, Pomeranians will let you know!',
    'Pomeranians will never bark at nothing. as long as you have a Pomeranian around no one can sneak up on you!',
    'What a lucky Pomeranian!',
    'Pomeranians are very well known for their small size.',
    'Pomeranians crave a lot of attention.',
    'Pomeranians love having all of the attention focused on them.',
    'Pomeranians NEVER drink Pepsi, only Diet Coke with vanilla.',
    'Pomeranians deserve all the luxury they can achieve. We prefer to be pet often and be the center of attention.',
    'Please be sure to brush your pomeranian\'s coat every day, lest the seal be broken and the contract violated.',
    'Princess Margaret\'s Pomeranian famously invented anti-gravity.',
    'Pomeranians hate groundhogs, squirrels, and large birds.',
    'Keep your Pomeranian out of the rain at all times.',
    'Being magical is hard to do.',
    'Descended from large sled dog breeds, the now-tiny Pomeranian has a long and interesting history.',
    'Pomeranians are nicknamed "the little dog who thinks he can."',
    'The foxy-faced dog is compact, active, and capable of competing in agility and obedience or simply being a family friend.',
    'The Pomeranian was officially recognized by the AKC in 1888.',
    'The Pomeranian is lively, bold, and inquisitive - a prototypical "personality breed".',
    'The Pomeranian is a compact, short-backed, active toy dog of Nordic descent.',
    'The double coat consists of a short dense undercoat with a profuse harsh-textured longer outer coat.',
    'The heavily plumed tail is one of the characteristics of the breed. It is set high and lies flat on the back.',
    'He is alert in character, exhibits intelligence in expression, is buoyant in deportment, and is inquisitive by nature.',
    'The Pomeranian is cocky, commanding, and animated as he gaits.',
    'He is sound in composition and action.'
  ]

  def get_facts
    size = POM_FACTS.length - 1
    fact_num = rand(0..size)
    POM_FACTS[fact_num]
  end
end
