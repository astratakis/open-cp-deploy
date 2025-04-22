

{
    generate_manifest(config, components):[
        component.generate(config),
        for component in components
    ]
}