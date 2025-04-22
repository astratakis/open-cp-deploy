local tk_env = import 'spec.json';
local g = import 'generate.libsonnet';

{

    components::[
        import 'api.libsonnet',
    ],


    manifests: g.generate_manifest($.components),

}