# Gray-Code-Verification

## Checklist
- [x] design
- [x] top
- [x] generator
- [x] driver
- [x] environment
- [x] transaction
- [x] interface
- [x] test
- [x] monitor
- [x] scoreboard

## Status
- Current Waveform:- (for reset_duration = 4)
![output](output.png)
- ![Current Output Log](output.log)

# Diagram
```
 [Reset Duration]                                                           
    ┌──────┐                                                                
    │Packet│                                                                
    └───┬──┘                                                                
        │                                                                   
        │                                                                   
        │                                                                   
   ┌────▼────┐                        Mailbox            Mailbox            
   │Generator│                           │                  │               
   └────┬────┘             ┌─────────┐   │    ┌─────────┐   │   ┌──────────┐
        │                  │Monitor_1├───┴────►Reference├───┴───►Scoreboard│
        │                  └───▲─────┘        │ Model   │       └────▲─────┘
        │Mailbox               │              └─────────┘            │      
        │                      │Virtual Interface                    │      
    ┌───▼──┐              ┌────┴────────────┐                        │      
    │Driver├──────────────►    Interface    │                    ┌───┴─────┐
    └──────┘Virtual       │   ┌─────────┐   ├────────────────────►Monitor_2│
           Interface      │   │         │   │      Virtual       └─────────┘
                          │   │ ┌─────┐ │   │     Interface                 
                          │   ├─► DUT ├─►   │                               
                          │   │ └▲────┘ │   │                               
                          └─▲─┘  │      └───┘                               
                            │    │                                          
                            │    │ Virtual                                  
                           ┌┴────┴┐Interface                                
                           │ clk  │                                         
                           └──────┘                                         
```
