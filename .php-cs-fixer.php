<?php

$rules = [
    'backtick_to_shell_exec'                        => true,
    'pow_to_exponentiation'                         => true,
    'no_trailing_comma_in_singleline_array'         => true,
    'no_whitespace_before_comma_in_array'           => true,
    'whitespace_after_comma_in_array'               => true,
    'encoding'                                      => true,
    'non_printable_character'                       => true,
    'constant_case'                                 => true,
    'lowercase_keywords'                            => true,
    'lowercase_static_reference'                    => true,
    'magic_constant_casing'                         => true,
    'magic_method_casing'                           => true,
    'native_function_casing'                        => true,
    'native_function_type_declaration_casing'       => true,
    'modernize_types_casting'                       => true,
    'short_scalar_cast'                             => true,
    'final_class'                                   => true,
    'ordered_interfaces'                            => true,
    'ordered_traits'                                => true,
    'self_static_accessor'                          => true,
    'date_time_immutable'                           => true,
    'multiline_comment_opening_closing'             => true,
    'elseif'                                        => true,
    'include'                                       => true,
    'random_api_migration'                          => true,
    'implode_call'                                  => true,
    'no_break_comment'                              => true,
    'no_superfluous_elseif'                         => true,
    'no_trailing_comma_in_list_call'                => true,
    'no_unneeded_control_parentheses'               => true,
    'no_unneeded_curly_braces'                      => true,
    'no_useless_else'                               => true,
    'simplified_if_return'                          => true,
    'switch_case_semicolon_to_colon'                => true,
    'switch_case_space'                             => true,
    'switch_continue_to_break'                      => true,
    'trailing_comma_in_multiline'                   => true,
    'yoda_style'                                    => true,
    'lambda_not_used_import'                        => true,
    'no_leading_import_slash'                       => true,
    'no_unused_imports'                             => true,
    'single_import_per_statement'                   => true,
    'single_line_after_imports'                     => true,
    'combine_consecutive_issets'                    => true,
    'dir_constant'                                  => true,
    'is_null'                                       => true,
    // 'single_space_after_construct'                  => true,
    'blank_line_after_namespace'                    => true,
    'clean_namespace'                               => true,
    'no_leading_namespace_whitespace'               => true,
    'single_blank_line_before_namespace'            => true,
    'logical_operators'                             => true,
    'new_with_braces'                               => true,
    'not_operator_with_space'                       => true,
    'not_operator_with_successor_space'             => true,
    'object_operator_without_whitespace'            => true,
    'operator_linebreak'                            => true,
    'standardize_increment'                         => true,
    'standardize_not_equals'                        => true,
    'ternary_operator_spaces'                       => true,
    'full_opening_tag'                              => true,
    'no_closing_tag'                                => true,
    'align_multiline_comment'                       => true,
    'no_blank_lines_after_phpdoc'                   => true,
    'no_empty_phpdoc'                               => true,
    'phpdoc_align'                                  => true,
    'phpdoc_indent'                                 => true,
    'phpdoc_line_span'                              => true,
    'phpdoc_no_empty_return'                        => true,
    'phpdoc_scalar'                                 => true,
    'phpdoc_order'                                  => true,
    'phpdoc_trim_consecutive_blank_line_separation' => true,
    'phpdoc_types'                                  => true,
    'no_useless_return'                             => true,
    'simplified_null_return'                        => true,
    'multiline_whitespace_before_semicolons'        => true,
    'no_empty_statement'                            => true,
    'no_singleline_whitespace_before_semicolons'    => true,
    'semicolon_after_instruction'                   => true,
    'explicit_string_variable'                      => true,
    'simple_to_complex_string_variable'             => true,
    'line_ending'                                   => true,
    'no_trailing_whitespace'                        => true,
    'single_blank_line_at_eof'                      => true,
    'array_syntax' => [
        'syntax' => 'short',
    ],
    'visibility_required' => [
        'elements' => [
            'property',
            'method',
        ],
    ],
    'no_alias_functions' => [
        'sets' => [
            '@internal',
            '@IMAP',
            '@time',
        ],
    ],
    'ordered_imports' => [
        'sort_algorithm' => 'alpha',
        'imports_order'  => [
            'const',
            'class',
            'function',
        ],
    ],
    'concat_space' => [
        'spacing' => 'one',
    ],
    'increment_style' => [
        'style' => 'post',
    ],
];

return ( new PhpCsFixer\Config() )->setRules( $rules )->setFinder( PhpCsFixer\Finder::create()->exclude( 'vendor' )->in( __DIR__ ) );
