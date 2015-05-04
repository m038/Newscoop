<?php
/**
 * @package Newscoop
 * @copyright 2015 Sourcefabric o.p.s.
 * @license http://www.gnu.org/licenses/gpl-3.0.txt
 */

namespace Newscoop\Tools\Console\Command;

use Symfony\Component\Console;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

/**
 * Index Reset Command
 */
class UpdatePluginsDataCommand extends Console\Command\Command
{
    /**
     * @see Console\Command\Command
     */
    protected function configure()
    {
        $this
            ->setName('plugins:update-data')
            ->setDescription('Update plugins data from plugin cache files.')
            ->addArgument('plugins', InputArgument::IS_ARRAY | InputArgument::REQUIRED, 'List all plugins which should be updated.');
    }

    /**
     * @see Console\Command\Command
     */
    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $pluginsManager = $this->getApplication()->getKernel()->getContainer()->getService('newscoop.plugins.manager');
        $plugins = $input->getArgument('plugins');

        $pluginsManager->updatePluginData($plugins);
    }
}
