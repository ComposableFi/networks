rec {
  devnet = {
    directories = {
      DEVNET_DATA_DIRECTORY = "~/.devnet";
      DEVNET_LOG_DIRECTORY = "/var/log/devnet";
    };
    mnemonics = {
      # action from usual users
      ALICE = "'document prefer nurse marriage flavor cheese west when knee drink sorry minimum thunder tilt cherry behave cute stove elder couch badge gown coral expire'";
      BOB = "'bleak slush nose opinion document sample embark couple cabbage soccer cage slow father witness canyon ring distance hub denial topic great beyond actress problem'";
      # APPLICATIONS are used to setup/own/admin contracts
      APPLICATION1 = "'apart ahead month tennis merge canvas possible cannon lady reward traffic city hamster monitor lesson nasty midnight sniff enough spatial rare multiply keep task'";
      APPLICATION2 = "'coffee hospital claim ability wrap load display submit lecture solid secret law base barrel miss tattoo desert want wall bar ketchup sauce real unknown'";
      # for bots
      DEMO_MNEMONIC_1 = "'banner spread envelope side kite person disagree path silver will brother under couch edit food venture squirrel civil budget number acquire point work mass'";
      DEMO_MNEMONIC_2 = "'veteran try aware erosion drink dance decade comic dawn museum release episode original list ability owner size tuition surface ceiling depth seminar capable only'";
      DEMO_MNEMONIC_3 = "'obscure canal because tomorrow tribe sibling describe satoshi kiwi upgrade bless empty math trend erosion oblige donate label birth chronic hazard ensure wreck shine'";
      # FAUCETS
      FAUCET_MNEMONIC = "'increase bread alpha rigid glide amused approve oblige print asset idea enact lawn proof unfold jeans rabbit audit return chuckle valve rather cactus great'";
      # RLY should be unique as these background relayers
      RLY_MNEMONIC_1 = "'derive kangaroo decrease ankle business zone timber innocent buyer multiply hero bench shop sausage human fury sauce detail level glow proud three animal uphold'";
      RLY_MNEMONIC_2 = "'region own pencil deliver easily gauge index august guide sibling copper rail range fame dragon snow print dragon pledge census evidence evoke invest peanut'";
      RLY_MNEMONIC_3 = "'black frequent sponsor nice claim rally hunt suit parent size stumble expire forest avocado mistake agree trend witness lounge shiver image smoke stool chicken'";
      RLY_MNEMONIC_4 = "'symbol force gallery make bulk round subway violin worry mixture penalty kingdom boring survey tool fringe patrol sausage hard admit remember broken alien absorb'";
      
      # VALIDATORSs
      VAL_MNEMONIC_1 = "'clock post desk civil pottery foster expand merit dash seminar song memory figure uniform spice circle try happy obvious trash crime hybrid hood cushion'";
      VAL_MNEMONIC_2 = "'angry twist harsh drastic left brass behave host shove marriage fall update business leg direct reward object ugly security warm tuna model broccoli choice'";
      VAL_MNEMONIC_3 = "'bottom loan skill merry east cradle onion journey palm apology verb edit desert impose absurd oil bubble sweet glove shallow size build burst effort'";

      EXCHNANGE_1 = "'traffic cool olive pottery elegant innocent aisle dial genuine install shy uncle ride federal soon shift flight program cave famous provide cute pole struggle'";
      MANTIS_1 = "'green inch denial draw output great truth source dad summer betray price used claim lab garment scout twice increase buyer banana sniff forum salad'"; 

      TEST1 = "'notice oak worry limit wrap speak medal online prefer cluster roof addict wrist behave treat actual wasp year salad speed social layer crew genius'";
      TEST2 = "'quality vacuum heart guard buzz spike sight swarm shove special gym robust assume sudden deposit grid alcohol choice devote leader tilt noodle tide penalty'";
    }; 
  };
  pica = import ./pica.nix { inherit devnet; };
  neutron = import ./neutron.nix { inherit devnet; };
  cosmos-hub = import ./cosmos-hub.nix { inherit devnet; };
  osmosis = import ./osmosis.nix { inherit devnet; };
}
