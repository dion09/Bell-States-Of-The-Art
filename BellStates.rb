use_osc " 192.168.1.2", 4560
# Example UDP Receiver in Sonic Pi
live_loop :udp_bell_10101 do
  use_real_time
  first_states = sync "/osc*/first_states"
  final_states = sync "/osc*/final_states"
  define :melody_0 do |m1|
    if m1== "0"
      with_fx :echo do
        with_synth :hollow do
          play 60 ,pan: -1, attack: 0.6 , attack_level: 0.8, sustain: 1.5, decay: 1,  sustain_level: 0.6, release: 6, room: 0.7
          sleep 0.2
        end
      end
    end
    if m1 == "1"
      with_fx :ping_pong do
        with_synth :piano do
          play 60 , pan: 1,attack: 0.7 , attack_level: 1, sustain: 0.7, decay: 0.7,  sustain_level: 1, release: 3, room: 0.5
          sleep 0.2
        end
      end
    end
  end
  
  
  define :melody_1 do |m2|
    if m2 == "0"
      with_fx :echo do
        with_synth :growl do
          play 60 , pan: -1,attack: 0.4 , attack_level: 0.4, sustain: 0.3,  sustain_level: 0.4, release: 6, room: 0.4
          sleep 0.2
        end
        
      end
    end
    
    if m2 == "1"
      with_fx :echo do
        with_fx :reverb,mix: 0.8 do
          play 60 , pan: 1,attack: 1 , attack_level: 0.5, sustain: 1.7, decay: 0.7,  sustain_level: 0.8, release: 5, room: 0.5
          sleep 0.2
        end
      end
    end
  end
  
  first_states.each do |first|
    
    melody_0(first)
    puts"#{first}"
    
  end
  
  final_states.each do |last|
    
    melody_1(last)
    puts"#{last}"
    
  end
end