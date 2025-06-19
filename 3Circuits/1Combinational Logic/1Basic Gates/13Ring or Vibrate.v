module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       
    output motor         
);

    //set two condition for '?'
    //remember to use '&&' as AND logigical operator
    //two assign condition contradict with each other, thus will only trigger one at once
    assign ringer = (!vibrate_mode && ring)? 1:0;
    assign motor = (vibrate_mode && ring)? 1:0;
    
endmodule