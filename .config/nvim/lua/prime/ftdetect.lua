vim.filetype.add({
    pattern = {
        -- Ansible
        ['.*/playbooks/.*.yml'] = 'yaml.ansible',
        ['.*/playbooks/.*.yaml'] = 'yaml.ansible',
        ['.*/roles/.*/tasks/.*.yml'] = 'yaml.ansible',
        ['.*/roles/.*/tasks/.*.yaml'] = 'yaml.ansible',
        ['.*/roles/.*/handlers/.*.yml'] = 'yaml.ansible',
        ['.*/roles/.*/handlers/.*.yaml'] = 'yaml.ansible',
    },
})

