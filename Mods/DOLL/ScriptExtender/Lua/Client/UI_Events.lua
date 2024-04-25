-- Open/Close mechanism - Key Input Event Listener --

Ext.Events.KeyInput:Subscribe(function (e)
        _D(e) 
        _P("print", e)


end)


------------------------------------------------------
--                                                  --
--               Server Event Listener              --
--                                                  --
------------------------------------------------------ 

Ext.Events.NetMessage:Subscribe(function(e) 

end)