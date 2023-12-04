rec {
  devnet = {
    devnetRootDirectory = "/tmp/composable-devnet";
    mnemonics = {
      VAL_MNEMONIC_1 = "'clock post desk civil pottery foster expand merit dash seminar song memory figure uniform spice circle try happy obvious trash crime hybrid hood cushion'";
      VAL_MNEMONIC_2 = "'angry twist harsh drastic left brass behave host shove marriage fall update business leg direct reward object ugly security warm tuna model broccoli choice'";
      DEMO_MNEMONIC_1 = "'banner spread envelope side kite person disagree path silver will brother under couch edit food venture squirrel civil budget number acquire point work mass'";
      DEMO_MNEMONIC_2 = "'veteran try aware erosion drink dance decade comic dawn museum release episode original list ability owner size tuition surface ceiling depth seminar capable only'";
      DEMO_MNEMONIC_3 = "'obscure canal because tomorrow tribe sibling describe satoshi kiwi upgrade bless empty math trend erosion oblige donate label birth chronic hazard ensure wreck shine'";
      RLY_MNEMONIC_1 = "'alley afraid soup fall idea toss can goose become valve initial strong forward bright dish figure check leopard decide warfare hub unusual join cart'";
      RLY_MNEMONIC_2 = "'record gift you once hip style during joke field prize dust unique length more pencil transfer quit train device arrive energy sort steak upset'";
      RLY_MNEMONIC_3 = "'black frequent sponsor nice claim rally hunt suit parent size stumble expire forest avocado mistake agree trend witness lounge shiver image smoke stool chicken'";
      RLY_MNEMONIC_4 = "'symbol force gallery make bulk round subway violin worry mixture penalty kingdom boring survey tool fringe patrol sausage hard admit remember broken alien absorb'";
    };
  };
  pica = import ./pica.nix { inherit devnet; };
  neutron = import ./neutron.nix { inherit devnet; };
  cosmos-hub = import ./cosmos-hub.nix { inherit devnet; };
  osmosis = import ./osmosis.nix { inherit devnet; };
}
