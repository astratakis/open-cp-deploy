local tk_env = import 'spec.json';
local g = import 'generate.libsonnet';

local ports = import 'ports.libsonnet';


{
    config:: ports 
    + {
        passwords: {
            api: "access123key",
        } ,
    },

    components::[
        import 'api.libsonnet',
    ],

    manifests: g.generate_manifest($.config, $.components),
}