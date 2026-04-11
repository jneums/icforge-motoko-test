import Timer "mo:base/Timer";
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";

persistent actor {
  var tickCount : Nat = 0;

  // Recurring timer — fires every 60 seconds
  ignore Timer.recurringTimer<system>(#seconds 60, func () : async () {
    tickCount += 1;
    Debug.print("[timer] tick #" # Nat.toText(tickCount) # " — canister is alive");
  });

  public query func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };

  public query func getTickCount() : async Nat {
    return tickCount;
  };
};
