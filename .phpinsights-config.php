<?php

declare(strict_types=1);

return [
    'preset' => 'default',
    'ide' => 'vscode',
    'exclude' => [],
    'config' => [],
    'requirements' => [],
    'add' => [
        NunoMaduro\PhpInsights\Domain\Metrics\Code\Code::class => [
            SlevomatCodingStandard\Sniffs\ControlStructures\RequireYodaComparisonSniff::class,
        ],
    ],
    'remove' => [
        PhpCsFixer\Fixer\FunctionNotation\VoidReturnFixerL::class,
        SlevomatCodingStandard\Sniffs\TypeHints\ReturnTypeHintSniff::class,
        SlevomatCodingStandard\Sniffs\TypeHints\ParameterTypeHintSniff::class,
        SlevomatCodingStandard\Sniffs\TypeHints\DeclareStrictTypesSniff::class,
        NunoMaduro\PhpInsights\Domain\Insights\ForbiddenDefineFunctions::class,
        SlevomatCodingStandard\Sniffs\ControlStructures\DisallowYodaComparisonSniff::class,
    ],
];
